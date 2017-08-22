package com.happyholiday.admin.viewstickets.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageViewsUpload;
import com.happyholiday.admin.viewstickets.service.ViewsServiceI;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



/**
 * 在struts2.xml中配置
 * 添加car
 * @author 熊铖
 * 
 */


public class ViewsUploadAction extends ActionSupport implements ModelDriven<PageViewsUpload>{
	private PageViewsUpload pageModel  = new PageViewsUpload();
	@Override
	public PageViewsUpload getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	
	//配置service
	private  ViewsServiceI viewsService;
	public ViewsServiceI getViewsService() {
		return viewsService;
	}
	@Autowired
	public void setViewsService(ViewsServiceI viewsService) {
		this.viewsService = viewsService;
	}
	
	public void addView(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewsService.addView(pageModel,onlineAdmin);
			retJSON.setMsg("上传成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			Tools.writeJSON(retJSON);
		}
	}

}
