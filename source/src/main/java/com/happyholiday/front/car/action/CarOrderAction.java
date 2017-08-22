package com.happyholiday.front.car.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.CarsBaseAction;
import com.happyholiday.front.car.pageModel.PageOrder;
import com.happyholiday.front.car.service.CarOrderServiceI;
import com.happyholiday.front.car.util.Tools;
import com.happyholiday.model.Orders;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontCarOrderAction", results={
		})
public class CarOrderAction extends CarsBaseAction implements ModelDriven<PageOrder>{
	private PageOrder order =  new PageOrder();
	@Override
	public PageOrder getModel() {
		// TODO 自动生成的方法存根
		return order;
	}
	//配置service
	private CarOrderServiceI  frontCarOrderService;
	public CarOrderServiceI getFrontCarOrderService() {
		return frontCarOrderService;
	}
	@Autowired
	public void setFrontCarOrderService(CarOrderServiceI frontCarOrderService) {
		this.frontCarOrderService = frontCarOrderService;
	}
	
	/**
	 * 下订单
	 * @param pageOrder
	 */
	public void saveOrder(){
		 JSONObject jo =new JSONObject();
		try {
		   Orders  od=	frontCarOrderService.saveOrder(order);
			jo.put("status", 1);
			jo.put("orderId", od.getId());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		 super.writeJSON(jo.toJSONString());
	}
	
	public void cancelOrder(){
		 JSONObject jo =new JSONObject();
			try {
		    	frontCarOrderService.cancelOrder(order);
				jo.put("status", 1);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			 super.writeJSON(jo.toJSONString());
	}
	
	/**
	 * 获取订单数据
	 */
	public void getOrders(){
		JSONObject jo =new JSONObject();
		try {
			List<PageOrder> orders = frontCarOrderService.getOrders(order);
			Tools.getSession().setAttribute("orders", orders);
			jo.put("rows", orders);
			jo.put("total", orders.size());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		super.writeJSON(jo.toJSONString());
	}
}
