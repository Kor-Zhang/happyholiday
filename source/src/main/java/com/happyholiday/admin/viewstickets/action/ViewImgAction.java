package com.happyholiday.admin.viewstickets.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageViewImgs;
import com.happyholiday.admin.viewstickets.service.ViewsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "viewImgAction", results={
		})
public class ViewImgAction extends AdminsBaseAction implements ModelDriven<PageViewImgs>{
	private PageViewImgs pageModel = new PageViewImgs();
	@Override
	public PageViewImgs getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	

	private ViewsServiceI viewsService;
	public ViewsServiceI getViewsService() {
		return viewsService;
	}
	@Autowired
	public void setViewsService(ViewsServiceI viewsService) {
		this.viewsService = viewsService;
	}


	public void setMain(){
		ReturnJSON retJSON = new ReturnJSON();	
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			viewsService.updateMainImg(pageModel,onlineAdmin);
			retJSON.setMsg("设置成功！");
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
