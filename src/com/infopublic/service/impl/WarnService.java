package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.entity.Warn;
import com.infopublic.util.PageData;
import com.infopublic.service.WarnManager;

@Service("warnService")
public class WarnService implements WarnManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Warn> getAllWarnList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<Warn>) dao.findForList("WarnMapper.getWarnlistPage", page);
	}

	@Override
	public Warn findByWid(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (Warn)dao.findForObject("WarnMapper.findByWid", pd);
	}

	@Override
	public void editW(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("WarnMapper.editWarnInfo", pd);
	}

	@Override
	public void deleteW(String wid) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("WarnMapper.deleteWI", wid);
	}

	@Override
	public void insertWarn(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("WarnMapper.insertWarnInfo", pd);
	}

	@Override
	public Warn findWid(int wid) throws Exception {
		// TODO 自动生成的方法存根
		return (Warn)dao.findForObject("WarnMapper.findwid", wid);
	}
	

}
