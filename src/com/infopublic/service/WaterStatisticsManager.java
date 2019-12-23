package com.infopublic.service;

import java.util.List;

import com.infopublic.entity.Page;
import com.infopublic.entity.WaterStatistics;




public interface WaterStatisticsManager {
	/**获取水库统计信息
	 * @param pd
	 * @throws Exception
	 */
//	public List<WaterStatistics> getWaterStatistics(String str)throws Exception;
//
//	public List<WaterStatistics> getWaters(String str)throws Exception;

	public List<WaterStatistics> getWaterStatistics(Page page)throws Exception;

	public List<WaterStatistics> getWaters(Page page)throws Exception;
	
}
