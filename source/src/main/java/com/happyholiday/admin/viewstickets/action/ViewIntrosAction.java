package com.happyholiday.admin.viewstickets.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageViewIntros;
import com.happyholiday.admin.viewstickets.service.ViewIntrosServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "viewIntorsAction", results={
		})
public class ViewIntrosAction extends AdminsBaseAction implements ModelDriven<PageViewIntros>{
	private  PageViewIntros pageModel = new PageViewIntros();
	@Override
	public PageViewIntros getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	//配置service
	private ViewIntrosServiceI viewIntrosService;
	@Autowired
	public ViewIntrosServiceI getViewIntrosService() {
		return viewIntrosService;
	}

	public void setViewIntrosService(ViewIntrosServiceI viewIntrosService) {
		this.viewIntrosService = viewIntrosService;
	}


	/**
	 * 获取景区介绍数据
	 */
	public void getViewIntrosDatagrid(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON< PageViewIntros> retJSON = new ReturnJSON<PageViewIntros>();
		try {
			retJSON =	viewIntrosService.getViewIntrosDatagrid(pageModel,onlineAdmin);
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
	/**
	 * 为景区添加介绍
	 */
	public void addViewIntro(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewIntrosService.addViewIntro(pageModel,onlineAdmin);
			retJSON.setMsg("添加成功！");
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
	 * 删除景区介绍
	 */
	public void deleteViewIntro(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewIntrosService.deleteViewIntro(pageModel,onlineAdmin);
			retJSON.setMsg("删除成功！");
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
	
	public void updateViewIntro(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewIntrosService.updateViewIntro(pageModel,onlineAdmin);
			retJSON.setMsg("编辑成功！");
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
}
