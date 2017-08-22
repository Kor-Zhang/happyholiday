package com.happyholiday.admin.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.pageModel.PageAdminPower;
import com.happyholiday.admin.service.AdminPowerServiceI;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "adminPowerAction")

public class AdminPowerAction extends AdminsBaseAction implements ModelDriven<PageAdminPower> {

	private PageAdminPower pageModel = new PageAdminPower();

	@Override
	public PageAdminPower getModel() {
		return pageModel;
	}
	
	//注入adminPowerService
	
	private AdminPowerServiceI adminPowerService;
	
	public AdminPowerServiceI getAdminPowerService() {
		return adminPowerService;
	}
	@Autowired
	public void setAdminPowerService(AdminPowerServiceI adminPowerService) {
		this.adminPowerService = adminPowerService;
	}
}
