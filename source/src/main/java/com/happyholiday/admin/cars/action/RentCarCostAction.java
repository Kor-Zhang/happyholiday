package com.happyholiday.admin.cars.action;

import java.io.File;
import java.util.Date;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.action.BaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.cars.service.RentCarCostServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageSrc;
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
@Action(value = "rentCarCostAction")
public class RentCarCostAction extends AdminsBaseAction implements ModelDriven<PageRentCarCost> {
	PageRentCarCost pageModel = new PageRentCarCost();
	@Override
	public PageRentCarCost getModel() {
		return pageModel;
	}
	//注入rentCarCostService
	private RentCarCostServiceI rentCarCostService;
	public RentCarCostServiceI getRentCarCostService() {
		return rentCarCostService;
	}
	@Autowired
	public void setRentCarCostService(RentCarCostServiceI rentCarCostService) {
		this.rentCarCostService = rentCarCostService;
	}
	/**
	 * 获取datagrid数据
	 * @author Jhon
	 */
	public void getDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageRentCarCost> retJSON = new BackReturnJSON<PageRentCarCost>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = rentCarCostService.getDatagrid(onlineAdmin,pageModel);
			retJSON.setMsg("");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	
}
