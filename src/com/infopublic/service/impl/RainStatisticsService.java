package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.entity.RainStatistics;
import com.infopublic.service.RainStatisticsManager;
@Service("RainStatisticsService")
public class RainStatisticsService  implements RainStatisticsManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@SuppressWarnings("unchecked")
	/**获取雨量统计数据，并以直方图的形式显示出来。
	 * @param pd
	 * @throws Exception
	 */
	public List<RainStatistics> getRainStatistics(Page page)throws Exception{
		return (List<RainStatistics>) dao.findForList("RainStatisticsMapper.getRainStatistics", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<RainStatistics> getRains(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<RainStatistics>) dao.findForList("RainStatisticsMapper.getRains", page);
	}
}
