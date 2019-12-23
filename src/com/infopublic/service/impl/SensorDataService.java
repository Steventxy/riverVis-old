package com.infopublic.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.entity.SensorData;
import com.infopublic.service.SensorDataManager;
import com.infopublic.util.PageData;

/**
 * @author 刘家玮
 * 程序名称：SensorDataService.java
 * 程序描述：
 * 修改时间：2017-10-25
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
@Service("SensorDataService")
public class SensorDataService implements SensorDataManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@SuppressWarnings("unchecked")
	/**获取传感器采集的数据
	 * @throws Exception
	 */
	public List<SensorData> getSensorData(String str)throws Exception{
		return (List<SensorData>) dao.findForList("SensorDataMapper.getSensorData", str);
	}
	//public List<SensorData> selectSensorData(HashMap<String,Object> params);
	@Override
	public List<SensorData> selectSensorDataByAidLike(HashMap<String, Object> params) throws Exception{
		// TODO 自动生成的方法存根
		return  (List<SensorData>) dao.findForList("SensorDataMapper.selectSensorDataByAidLike", params);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<SensorData> collectdatalistPage(Page page) throws Exception {
		// TODO 自动生成的方法存根
		return  (List<SensorData>) dao.findForList("SensorDataMapper.collectdatalistPage",page);
	}
	
	
	
}



