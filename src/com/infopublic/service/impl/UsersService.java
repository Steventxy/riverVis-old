package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.entity.Users;
import com.infopublic.util.PageData;
import com.infopublic.service.UsersManager;


/** 系统管理用户
 */
@Service("usersService")
public class UsersService implements UsersManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public Users getUserByNameAndPwd(PageData pd)throws Exception{
		Users user =(Users)dao.findForObject("UsersMapper.getUserInfo", pd);
		return user;
	}
	/**登陆名是否存在判断
	 * @param loginid
	 * @return
	 * @throws Exception
	 */
	@Override
	public String checkLoginid(String loginid)throws Exception{
		return (String)dao.findForObject("UsersMapper.getUseridByLoginid", loginid);
	}
	/**用户注册
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void insertUser(PageData pd)throws Exception{
		dao.save("UsersMapper.insertUserInfo", pd);
	}
	/**通过useid获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public Users findByUserid(PageData pd)throws Exception{
		return (Users)dao.findForObject("UsersMapper.findByUserid", pd);
	}

	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editU(PageData pd)throws Exception{
		dao.update("UsersMapper.editUserInfo", pd);
	}
	/**修改用户密码
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editPwd(PageData pd) throws Exception {
		dao.update("UsersMapper.editUserPwd", pd);
	}

	/**
	 * 删除用户设置和信息
	 */
	@Override
	public void deleteU(String userid) throws Exception {
		dao.delete("UsersMapper.deleteUI", userid);
	}

	/**修改用户账号可用状态
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editIsenabled(PageData pd) throws Exception {
		dao.update("UsersMapper.editIsenabled", pd);
	}
	/**
	 * 根据用户编号获取其区域下的用户信息(excel导出)
	 * @param  page
	 * @param @throws Exception 
	 * @return List<PageData>
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getUserListByIds(PageData pd) throws Exception{
		return (List<Users>) dao.findForList("UsersMapper.getUserListByIds", pd);
	}
	/**
	 * 用户信息列表
	 * @param  page
	 * @param @throws Exception 
	 * @return List<User>
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Users> getAllUserList(Page page) throws Exception {
		return (List<Users>) dao.findForList("UsersMapper.getUserslistPage", page);
	}
	/**通过用户ID获取区域编号
	 * @param integer
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getAidByUserid(String userid) throws Exception {
		// TODO Auto-generated method stub
		return (String) dao.findForObject("UsersMapper.getAidByUserid", userid);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listUsersByAids(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<Users>) dao.findForList("UsersMapper.listUsersByAids",pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getUserByAidlist(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UsersMapper.getUserByAidlist", pd);
	}
}
