package com.happyholiday.admin.cars.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.dao.OrdersDaoI;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageOrders;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.OrdersException;
import com.happyholiday.admin.service.OrdersServiceI;
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
@Action(value = "ordersAction")

public class OrdersAction extends AdminsBaseAction implements ModelDriven<PageOrders> {
	//注入模型
	private PageOrders pageModel = new PageOrders();

	@Override
	public PageOrders getModel() {
		return pageModel;
	}
	//注入ordersservice
	private OrdersServiceI ordersService;
	
	
	public OrdersServiceI getOrdersService() {
		return ordersService;
	}

	@Autowired
	public void setOrdersService(OrdersServiceI ordersService) {
		this.ordersService = ordersService;
	}
	/**
	 * 更新管理员对order备注
	 * 
	 */
	public void updateOrdersAdminNote(){
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
			ordersService.updateOrdersAdminNote(onlineAdmin,pageModel);
			retJSON.setMsg("获取信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}

	/**
	 * 方法
	 */
	public void getOrdersDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageOrders> retJSON = new BackReturnJSON<PageOrders>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = ordersService.getOrdersDatagrid(onlineAdmin,pageModel);
			retJSON.setMsg("获取信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 更新order的status信息，也会更新其realgetdress，realgettime，realreturnaddress，realreturnaddress
	 */
	public void updateOrdersStatus(){
		/**
		 * 1.获取当前的admin，用户验证权限
		 * 2.查询信息
		 * 3.返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务

			ordersService.updateOrdersStatus(onlineAdmin,pageModel);
			//设置结果
			retJSON.setMsg("更新成功！");
			retJSON.setSuccess(true);
		}  catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//3.返回结果
		super.writeJSON(retJSON);
		
	}
	/**
	 * 获取指定orderid的车辆费用详情（包括车辆每日租金和保险等）
	 */
	public void getCostDatagridByOrderId(){
		/**
		 * 1.获取当前的admin，用户验证权限
		 * 2.查询信息
		 * 3.返回结果
		 */
		BackReturnJSON<PageRentCarCost> retJSON = new BackReturnJSON<PageRentCarCost>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务

			retJSON = ordersService.getCostDataByOrderId(onlineAdmin,pageModel);
			//设置结果
			retJSON.setMsg("获取成功！");
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
			//3.返回结果
			super.writeJSON(retJSON);
		}
	}
}
