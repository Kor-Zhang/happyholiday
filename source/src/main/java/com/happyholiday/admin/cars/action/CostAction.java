package com.happyholiday.admin.cars.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.cars.pageModel.PageCost;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.cars.service.CostServiceI;
import com.happyholiday.admin.cars.service.RentCarCostServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Rentcarcost;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "costAction")
public class CostAction extends AdminsBaseAction implements ModelDriven<PageCost> {
	PageCost pageModel = new PageCost();
	@Override
	public PageCost getModel() {
		return pageModel;
	}
	//注入costService
	private CostServiceI costService;
	
	
	public CostServiceI getCostService() {
		return costService;
	}

	@Autowired
	public void setCostService(CostServiceI costService) {
		this.costService = costService;
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
		BackReturnJSON<PageCost> retJSON = new BackReturnJSON<PageCost>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = costService.getDatagrid(onlineAdmin,pageModel);
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
	/**
	 * 修改租借汽车费用项
	 */
	public void editCost(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			costService.editCost(onlineAdmin,pageModel);
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
	/**
	 * 添加汽车费用项
	 */
	public void addCost(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			costService.addCost(onlineAdmin,pageModel);
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
	/**
	 * 删除汽车费用项
	 */
	public void deleteCost(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			costService.deleteCost(onlineAdmin,pageModel);
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
