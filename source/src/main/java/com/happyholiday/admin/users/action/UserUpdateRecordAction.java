package com.happyholiday.admin.users.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.pageModel.PageUserLoginRecord;
import com.happyholiday.admin.users.pageModel.PageUserUpdateRecord;
import com.happyholiday.admin.users.service.UserUpdateRecordServiceI;
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
@Action(value = "userUpdateRecordAction")
public class UserUpdateRecordAction extends AdminsBaseAction implements
		ModelDriven<PageUserUpdateRecord> {
	PageUserUpdateRecord pageModel = new PageUserUpdateRecord();

	@Override
	public PageUserUpdateRecord getModel() {
		return pageModel;
	}
	//注入userUpdateRecordService
	private UserUpdateRecordServiceI userUpdateRecordService;
	
	
	public UserUpdateRecordServiceI getUserUpdateRecordService() {
		return userUpdateRecordService;
	}

	@Autowired
	public void setUserUpdateRecordService(
			UserUpdateRecordServiceI userUpdateRecordService) {
		this.userUpdateRecordService = userUpdateRecordService;
	}


	public void getDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUserUpdateRecord> returnJSON = new BackReturnJSON<PageUserUpdateRecord>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			returnJSON = userUpdateRecordService.getDatagrid(onlineAdmin,pageModel);
			returnJSON.setMsg("读取信息成功！");
			returnJSON.setSuccess(true);
		} catch (AdminsException e) {
			returnJSON.setMsg(e.getMessage());
			returnJSON.setSuccess(false);
			e.printStackTrace();
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
