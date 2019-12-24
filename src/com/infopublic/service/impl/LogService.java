package com.infopublic.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.service.LogManager;
import com.infopublic.util.Jurisdiction;
import com.infopublic.util.PageData;



/** 系统用户
 */
@Service("logService")
public class LogService implements LogManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getLogs(Page page) throws Exception {
		return (List<PageData>) dao.findForList("LogMapper.getLoglistPage", page);
	}
	/**
	 * 保存日志信息
	 */
	@Override
	public void saveLog(String logtype, String functions, String logcontent,
			String ip,String remark) throws Exception {
		PageData logpd = new PageData();
		logpd.put("userid",Jurisdiction.getUserid());	
		logpd.put("logtype",logtype);	
		logpd.put("functions",functions);
		logpd.put("logcontent",logcontent);	
		logpd.put("ip",ip);	
		logpd.put("remark",remark);	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		logpd.put("logtime",df.format(new Date()));	
		dao.save("LogMapper.saveLog", logpd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getLogsByIds(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("LogMapper.getLogListByIds", pd);
	}
	
}
