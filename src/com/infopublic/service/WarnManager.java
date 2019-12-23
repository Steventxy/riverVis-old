package com.infopublic.service;

import java.util.List;

import com.infopublic.entity.Page;
import com.infopublic.entity.Warn;
import com.infopublic.util.PageData;

public interface WarnManager {
	/**
	 * 预警信息列表
	 * @param  page
	 * @param @throws Exception 
	 * @return List<User>
	 */
	public List<Warn> getAllWarnList(Page page) throws Exception;
	
	/**通过useid获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Warn findByWid(PageData pd)throws Exception;
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void editW(PageData pd)throws Exception;
	/**
	 * 删除
	 * @param userid
	 */
	public void deleteW(String wid)throws Exception;
	/**添加
	 * @param pd
	 * @throws Exception
	 */
	public void insertWarn(PageData pd)throws Exception;
	
	//预警测试
	public Warn findWid(int wid)throws Exception;
}
