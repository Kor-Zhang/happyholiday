package com.happyholiday.front.viewstickets.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.ViewsTicketsBaseAction;
import com.happyholiday.front.viewstickets.pageModel.PageViewTickets;
import com.happyholiday.front.viewstickets.service.ViewTicektServiceI;
import com.happyholiday.front.viewstickets.util.Tools;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontViewTicketAction", results={
		@Result(name = "getTicket_success", location = "/viewticket/viewOrder.jsp"),
		})
public class ViewTicketAction extends ViewsTicketsBaseAction implements ModelDriven<PageViewTickets>{
	private PageViewTickets pageModel = new PageViewTickets();
	@Override
	public PageViewTickets getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	
	//配置service
	private  ViewTicektServiceI frontViewTicketservice;
	public ViewTicektServiceI getFrontViewTicketservice() {
		return frontViewTicketservice;
	}
	@Autowired
	public void setFrontViewTicketservice(ViewTicektServiceI frontViewTicketservice) {
		this.frontViewTicketservice = frontViewTicketservice;
	}
	
	public String getOneTicket(){
		try {
			PageViewTickets ticket = frontViewTicketservice.getOneTicket(pageModel);
			Tools.getSession().setAttribute("oneViewTicket", ticket);
			return "getTicket_success";
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "get_success";
		}
	}
	
	
}
