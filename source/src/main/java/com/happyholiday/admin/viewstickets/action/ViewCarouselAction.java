package com.happyholiday.admin.viewstickets.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.Static;
import com.happyholiday.admin.viewstickets.pageModel.PageViewCarousels;
import com.happyholiday.admin.viewstickets.service.ViewCarouselsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "viewCarouselAction", results={
		})
public class ViewCarouselAction extends AdminsBaseAction implements ModelDriven<PageViewCarousels> {
	private PageViewCarousels pageModel = new PageViewCarousels();
	@Override
	public PageViewCarousels getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	
	//配置service
	private ViewCarouselsServiceI viewCarouselservice;
	public ViewCarouselsServiceI getViewCarouselservice() {
		return viewCarouselservice;
	}
	@Autowired
	public void setViewCarouselservice(ViewCarouselsServiceI viewCarouselservice) {
		this.viewCarouselservice = viewCarouselservice;
	}
	
	public void getDatagird(){
		ReturnJSON<PageViewCarousels> retJSON = new ReturnJSON<PageViewCarousels>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			retJSON = viewCarouselservice.getViewCarouselsDatagrid(pageModel,onlineAdmin);
			retJSON.setMsg("获取成功");
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
	
	public void deleteCarousel(){
		ReturnJSON retJSON = new ReturnJSON();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			viewCarouselservice.deleteCarouselImg(pageModel,onlineAdmin);
			retJSON.setMsg("删除成功");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg("删除失败");
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}	
	}
	
	public void getCarouselByImgName(){
		String imgName = pageModel.getImgName();
		
		//图片资源目录
		String imgPath = Static.viewCarouselPath;
		//请求的图片资源
		String imgDir = imgPath+File.separator+imgName;
		File imgFile = new File(imgDir);
		if(!imgFile.exists()){
			imgDir = imgPath+File.separator+"default.png";
			imgFile = new File(imgDir);
		}
		writeImg(imgFile);
	}
}
