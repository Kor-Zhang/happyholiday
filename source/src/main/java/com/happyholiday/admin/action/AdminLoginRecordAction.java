package com.happyholiday.admin.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.standard.Severity;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.exception.AdminLoginRecordException;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdminLoginRecord;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.service.AdminLoginRecordServiceI;
import com.happyholiday.admin.service.AdminsServiceI;
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
@Action(value = "adminLoginRecordAction")
public class AdminLoginRecordAction extends AdminsBaseAction implements ModelDriven<PageAdminLoginRecord> {
	
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AdminLoginRecordAction.class);
	public PageAdminLoginRecord pageAdminLoginRecord = new PageAdminLoginRecord();

	@Override
	public PageAdminLoginRecord getModel() {
		return pageAdminLoginRecord;
	}
	

	private AdminLoginRecordServiceI adminLoginRecordService;
	
	public AdminLoginRecordServiceI getAdminLoginRecordService() {
		return adminLoginRecordService;
	}
	@Autowired
	public void setAdminLoginRecordService(
			AdminLoginRecordServiceI adminLoginRecordService) {
		this.adminLoginRecordService = adminLoginRecordService;
	}
	
	
	public void getDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageAdminLoginRecord> returnJSON = new BackReturnJSON<PageAdminLoginRecord>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			logger.info(pageAdminLoginRecord);
			//2.执行事务
			returnJSON = adminLoginRecordService.getDatagrid(onlineAdmin,pageAdminLoginRecord);
			returnJSON.setMsg("读取信息成功！");
			returnJSON.setSuccess(true);
		} catch (Exception e) {
			returnJSON.setMsg(e.getMessage());
			returnJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			logger.info(returnJSON);
			//返回结果
			super.writeJSON(returnJSON);
		}
	}
	
}
