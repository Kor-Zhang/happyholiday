package com.happyholiday.admin.viewstickets.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;




import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageViewOrders;
import com.happyholiday.admin.viewstickets.service.ViewOrdersServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "viewOrdersAction", results={
		})
public class ViewOrdersAction extends AdminsBaseAction implements ModelDriven<PageViewOrders>{
	private PageViewOrders pageModel = new PageViewOrders();
	@Override
	public PageViewOrders getModel() {
		// TODO Auto-generated method stub
		return pageModel;
	}
	
	//配置service
	private ViewOrdersServiceI viewOrdersService;
	public ViewOrdersServiceI getViewOrdersService() {
		return viewOrdersService;
	}
	@Autowired
	public void setViewOrdersService(ViewOrdersServiceI viewOrdersService) {
		this.viewOrdersService = viewOrdersService;
	}
	/*************************后台管理方法********************************/
	/**
	 *  获取景区订单管理的数据
	 */
	public void getViewOrdersDatagrid(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON<PageViewOrders> retJSON = new ReturnJSON<PageViewOrders>();
		try {
			//执行事务
			retJSON = viewOrdersService.getViewOrdersDatagrid(pageModel,onlineAdmin);
			retJSON.setMsg("");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	
	public void updateOrdersStatus(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewOrdersService.updateOrdersStatus(pageModel,onlineAdmin);
			//设置结果
			retJSON.setMsg("更新成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//3.返回结果
		super.writeJSON(retJSON);
	}
}
