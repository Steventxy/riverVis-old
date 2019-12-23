package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.entity.WaterStatistics;
import com.infopublic.service.WaterStatisticsManager;
@Service("WaterStatisticsService")
public class WaterStatisticsService  implements WaterStatisticsManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@SuppressWarnings("unchecked")
	/**获取雨量统计数据，并以直方图的形式显示出来。
	 * @param pd
	 * @throws Exception
	 */
	public List<WaterStatistics> getWaterStatistics(Page page)throws Exception{
		return (List<WaterStatistics>) dao.findForList("WaterStatisticsMapper.getWaterStatistics", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<WaterStatistics> getWaters(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<WaterStatistics>) dao.findForList("WaterStatisticsMapper.getWaters", page);
	}
}
