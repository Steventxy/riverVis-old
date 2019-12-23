package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;







import com.infopublic.dao.PowDaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.entity.Pow;
import com.infopublic.service.PowManager;
import com.infopublic.util.PageData;

@Service("powService")
public class PowService implements PowManager {

	@Resource(name = "powdaoSupport")
	private PowDaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Pow> getPowlist(PageData pd) throws Exception {
		// TODO 自动生成的方法存根
		return (List<Pow>)dao.findForList("PowMapper.getPowlist", pd);
	}

	@Override
	public Pow getnowPow(PageData pd) throws Exception {
		// TODO 自动生成的方法存根
		return (Pow) dao.findForObject("PowMapper.getnowPow",pd);
	}

	


	@SuppressWarnings("unchecked")
	@Override
	public List<Pow> getOrgnzdata(Page page) throws Exception {
		// TODO 自动生成的方法存根
		return (List<Pow>)dao.findForList("PowMapper.getOrgnzlistPage", page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pow> getdataview(PageData pd) throws Exception {
		// TODO 自动生成的方法存根
		return (List<Pow>)dao.findForList("PowMapper.getdataview", pd);
	}
}
