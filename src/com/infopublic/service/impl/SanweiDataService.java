package com.infopublic.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.SanweiData;
import com.infopublic.service.SanweiDataManager;
/**
 * @author 刘家玮
 * 程序名称：
 * 时间：
 * 修改时间：
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
@Service("SanweiDataService")
public class SanweiDataService implements SanweiDataManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@SuppressWarnings("unchecked")
	/**获取导入三维场景的数据
	 * @param pd
	 * @throws Exception
	 */
	public List<SanweiData> getSanweiData(String str)throws Exception{
		return (List<SanweiData>) dao.findForList("SanweiDataMapper.getSanweiData", str);
	}
}
