package com.infopublic.service;

import java.util.List;

import com.infopublic.entity.Page;
import com.infopublic.util.PageData;
import java.awt.Button;
import java.awt.CardLayout;
import java.awt.Frame;
import java.awt.Panel;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;


/**
 * 短信箱
 *
 */
public interface MessageManager {
	/**
	 * 获取发件箱短信
	 * @param page
	 * @return
	 * @throws Exception
	 */

	public List<PageData> listSendMessage(Page page) throws Exception; 
	/**
	 * 获取收件箱短信
	 * @param page
	 * @return
	 * @throws Exception
	 */

	public List<PageData> listReceiveMessage(Page page) throws Exception;
	/**
	 * 添加发送短信记录
	 * @param pd
	 * @throws Exception
	 */

	public void addSendMessage(PageData pd) throws Exception;
	public void addSendMessage1(List<PageData> pdlist) throws Exception; 
	
}
