package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.service.InfoManager;
import com.infopublic.util.PageData;

@Service("infoService")
public class InfoService implements InfoManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> listSendIFs(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveSendIF(PageData pd) throws Exception {
		// TODO oAuto-generated method stub
		
	}

	@Override
	public List<PageData> getAllManageUser(String para) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}