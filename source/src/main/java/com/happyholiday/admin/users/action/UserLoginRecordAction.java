package com.happyholiday.admin.users.action;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdminLoginRecord;
import com.happyholiday.admin.service.AdminLoginRecordServiceI;
import com.happyholiday.admin.users.pageModel.PageUserLoginRecord;
import com.happyholiday.admin.users.service.UserLoginRecordServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "userLoginRecordAction")
public class UserLoginRecordAction extends AdminsBaseAction implements ModelDriven<PageUserLoginRecord> {
	PageUserLoginRecord pageModel = new PageUserLoginRecord();

	@Override
	public PageUserLoginRecord getModel() {
		return pageModel;
	}
	//注入userLoginRecordService
	private UserLoginRecordServiceI userLoginRecordService;
	
	public UserLoginRecordServiceI getUserLoginRecordService() {
		return userLoginRecordService;
	}

	public void setUserLoginRecordService(
			UserLoginRecordServiceI userLoginRecordService) {
		this.userLoginRecordService = userLoginRecordService;
	}

	public void getDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUserLoginRecord> returnJSON = new BackReturnJSON<PageUserLoginRecord>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			returnJSON = userLoginRecordService.getDatagrid(onlineAdmin,pageModel);
			returnJSON.setMsg("读取信息成功！");
			returnJSON.setSuccess(true);
		} catch (Exception e) {
			returnJSON.setMsg(e.getMessage());
			returnJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(returnJSON);
		}
	}
	
	
}
