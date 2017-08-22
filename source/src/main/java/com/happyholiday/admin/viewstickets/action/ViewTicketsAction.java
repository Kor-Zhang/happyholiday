package com.happyholiday.admin.viewstickets.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageViewTickets;
import com.happyholiday.admin.viewstickets.service.ViewTicketsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "viewTicketsAction", results={
		})
public class ViewTicketsAction extends AdminsBaseAction implements ModelDriven<PageViewTickets> {
	private PageViewTickets pageModel = new PageViewTickets();
	@Override
	public PageViewTickets getModel() {
		// TODO 自动生成的方法存根
		return  pageModel;
	}
	
	//配置viewTicketsService
	private ViewTicketsServiceI viewTicketsService;
	public ViewTicketsServiceI getViewTicketsService() {
		return viewTicketsService;
	}
	@Autowired
	public void setViewTicketsService(ViewTicketsServiceI viewTicketsService) {
		this.viewTicketsService = viewTicketsService;
	}
	
	/**
	 * 获取景区门票数据
	 */
	public void getViewTicketsDatagrid(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON<PageViewTickets> retJSON = new ReturnJSON<PageViewTickets>();
		try {
			retJSON = viewTicketsService.getViewTicketsDatagrid(pageModel,onlineAdmin);
			retJSON.setMsg("获取成功!");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg("获取失败!");
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 添加门票
	 */
	public void addViewTicket(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewTicketsService.addViewTicket(pageModel,onlineAdmin);
			retJSON.setMsg("添加成功!");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 更新门票信息
	 */
	public void updateViewTicket(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewTicketsService.updateViewTicket(pageModel,onlineAdmin);
			retJSON.setMsg("修改成功!");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 删除门票信息
	 */
	public void deleteViewTicket(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewTicketsService.deleteViewTicket(pageModel,onlineAdmin);
			retJSON.setMsg("删除成功!");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	
	public void getOneViewTicket(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON<PageViewTickets> retJSON = new ReturnJSON<PageViewTickets>();
		try {
			retJSON = viewTicketsService.getOneViewTicket(pageModel,onlineAdmin);
			retJSON.setMsg("获取成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
}
