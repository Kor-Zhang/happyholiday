package com.happyholiday.admin.action;

import java.io.File;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCarImgs;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.cars.service.CarImgsServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.NoticesException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.pageModel.PageNotices;
import com.happyholiday.admin.service.NoticesServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "noticesAction")

public class NoticesAction extends AdminsBaseAction implements ModelDriven<PageNotices> {

	private PageNotices pageModel = new PageNotices();

	@Override
	public PageNotices getModel() {
		return pageModel;
	}
	//注入noticesService
	private NoticesServiceI noticesService;

	public NoticesServiceI getNoticesService() {
		return noticesService;
	}
	@Autowired
	public void setNoticesService(NoticesServiceI noticesService) {
		this.noticesService = noticesService;
	}
	
	/**
	 * 添加公告
	 */
	public void addNotices(){
		BackReturnJSON<PageAdmins> retJSON = new BackReturnJSON<PageAdmins>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			noticesService.addNotices(onlineAdmin,pageModel);
			retJSON.setMsg("添加成功！");
			retJSON.setSuccess(true);
		}catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
	}
	/**
	 * 获取公告
	 */
	public void getNoticesDatagrid(){
		BackReturnJSON<PageNotices> retJSON = new BackReturnJSON<PageNotices>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = noticesService.getNoticesDatagrid(onlineAdmin,pageModel);
			retJSON.setMsg("获取信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
	}
	
	/**
	 * 普通管理员获取公告（无需权限）
	 */
	public void getNoticesList(){
		BackReturnJSON<PageNotices> retJSON = new BackReturnJSON<PageNotices>();
		try { 
			//执行事务
			List<PageNotices> list = noticesService.getNoticesList(pageModel);
			retJSON.setRows(list);
			retJSON.setMsg("获取信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
	}
	/**
	 * 获取指定id的Notice的详情
	 */
	public void getSingleNoticeDatagridById(){
		BackReturnJSON<PageNotices> retJSON = new BackReturnJSON<PageNotices>();
		try {
			//执行事务
			PageNotices pageNotice = noticesService.getSingleNoticeDatagridById(pageModel);
			retJSON.setObj(pageNotice);
			retJSON.setMsg("获取信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (NoticesException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
	}
	/**
	 * 编辑公告
	 */
	public void editNotices(){
		BackReturnJSON<PageNotices> retJSON = new BackReturnJSON<PageNotices>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			noticesService.editNotices(onlineAdmin,pageModel);
			retJSON.setMsg("修改信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
	}
	/**
	 * 删除notices
	 */
	public void deleteNotices(){
		BackReturnJSON<PageNotices> retJSON = new BackReturnJSON<PageNotices>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			noticesService.deleteNotices(onlineAdmin,pageModel);
			retJSON.setMsg("删除信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
	}
}




