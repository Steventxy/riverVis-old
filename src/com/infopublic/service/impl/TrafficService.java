package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.service.TrafficManager;
import com.infopublic.util.PageData;

@Service("trafficService")
public class TrafficService implements TrafficManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listTerTraffic(Page page) throws Exception {
		return  (List<PageData>) dao.findForList("TrafficMapper.getTrafficlistPage",page);
	}
	@Override
	public void updateTerTrafficLimit(List<PageData> pdlist) throws Exception {
		dao.batchUpdate("TrafficMapper.updateTerTrafficLimit", pdlist);
	}
	public void updateTerTrafficToZero(String str) throws Exception{
		dao.update("TrafficMapper.updateTerTrafficToZero", str);
	}

}
