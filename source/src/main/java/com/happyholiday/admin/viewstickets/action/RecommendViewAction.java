package com.happyholiday.admin.viewstickets.action;


import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.Static;
import com.happyholiday.admin.viewstickets.pageModel.PageRecommendViews;
import com.happyholiday.admin.viewstickets.service.RecommendViewsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "recommendViewAction", results={
		})
public class RecommendViewAction extends AdminsBaseAction implements ModelDriven<PageRecommendViews>{
	private PageRecommendViews pageModel = new PageRecommendViews();
	@Override
	public PageRecommendViews getModel() {
		// TODO Auto-generated method stub
		return pageModel;
	}
	
	//配置service
	private RecommendViewsServiceI recommendViewsService;
	public RecommendViewsServiceI getRecommendViewsService() {
		return recommendViewsService;
	}
	@Autowired
	public void setRecommendViewsService(
			RecommendViewsServiceI recommendViewsService) {
		this.recommendViewsService = recommendViewsService;
	}
	
	public void getDatagird(){
		ReturnJSON<PageRecommendViews> retJSON = new ReturnJSON<>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			retJSON = recommendViewsService.getDatagrid(onlineAdmin, pageModel);
			retJSON.setMsg("获取成功");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
		 
	}
	
	public void addRecommendView(){
		ReturnJSON retJSON = new ReturnJSON<>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			recommendViewsService.addRecommendView(onlineAdmin, pageModel);
			retJSON.setMsg("添加信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
	
	public void deleteRecommendView(){
		ReturnJSON retJSON = new ReturnJSON<>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			recommendViewsService.deleteRecommendView(onlineAdmin, pageModel);
			retJSON.setMsg("删除信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
	
	public void getRecommendViewImgName(){
		String imgName = pageModel.getImgName();
		//景区资源图片路径
		String viewsImgPath = Static.viewsImgPath;
		//请求的图片资源
		String imgDir = viewsImgPath + File.separator+imgName;
		File imgFile = new File(imgDir);
		writeImg(imgFile);
	}
}
