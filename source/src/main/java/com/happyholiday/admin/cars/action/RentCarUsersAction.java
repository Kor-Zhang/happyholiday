package com.happyholiday.admin.cars.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageRentCarUsers;
import com.happyholiday.admin.cars.service.RentCarUsersServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.users.service.UsersServiceI;
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
@Action(value = "rentCarUsersAction")

public class RentCarUsersAction extends AdminsBaseAction implements ModelDriven<PageRentCarUsers> {

	
	private PageRentCarUsers pageModel = new PageRentCarUsers();

	@Override
	public PageRentCarUsers getModel() {
		return pageModel;
	}
	

	//配置rentCarUsersService
	private RentCarUsersServiceI rentCarUsersService;
	
	
	public RentCarUsersServiceI getRentCarUsersService() {
		return rentCarUsersService;
	}

	@Autowired
	public void setRentCarUsersService(RentCarUsersServiceI rentCarUsersService) {
		this.rentCarUsersService = rentCarUsersService;
	}


	public void getSingleRentCarUserDatagridById(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageRentCarUsers> retJSON = new BackReturnJSON<PageRentCarUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = rentCarUsersService.getSingleRentCarUserDatagridById(onlineAdmin,pageModel);
			retJSON.setMsg("读取信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}
}
