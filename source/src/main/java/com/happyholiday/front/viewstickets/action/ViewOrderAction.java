package com.happyholiday.front.viewstickets.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.ViewsTicketsBaseAction;
import com.happyholiday.front.viewstickets.pageModel.PageViewOrder;
import com.happyholiday.front.viewstickets.service.ViewOrderServiceI;
import com.happyholiday.front.viewstickets.util.ReturnJSON;
import com.happyholiday.front.viewstickets.util.Tools;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontViewOrderAction", results={
		/*@Result(name = "get_success", location = "/viewticket/viewticket.jsp"),*/
		})
public class ViewOrderAction extends ViewsTicketsBaseAction implements ModelDriven<PageViewOrder>{
	private PageViewOrder  pageModel = new PageViewOrder();
	@Override
	public PageViewOrder getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	
	//配置service
	private ViewOrderServiceI frontViewOrderservice;
	public ViewOrderServiceI getFrontViewOrderservice() {
		return frontViewOrderservice;
	}
	@Autowired
	public void setFrontViewOrderservice(ViewOrderServiceI frontViewOrderservice) {
		this.frontViewOrderservice = frontViewOrderservice;
	}
	
	public void addTicket(){
		try {
			frontViewOrderservice.addOrder(pageModel);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	public void getOrders(){
		ReturnJSON<PageViewOrder> retJson = new ReturnJSON<PageViewOrder>();
		try {
			retJson = frontViewOrderservice.getOrders(pageModel);
			Tools.getSession().setAttribute("ViewOrders", retJson.getRows());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		super.writeJSON(retJson);
	}
	
	public void cancelOrder(){
		JSONObject jo =new JSONObject();
		try {
			frontViewOrderservice.cancelOrder(pageModel);
			jo.put("status", 1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		super.writeJSON(jo.toJSONString());
	}
}
