package com.happyholiday.admin.viewstickets.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.action.ViewsTicketsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageImgs;
import com.happyholiday.admin.viewstickets.pageModel.PageViews;
import com.happyholiday.admin.viewstickets.service.ViewsServiceI;
import com.happyholiday.admin.viewstickets.Static;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "viewsAction", results={
		})
public class ViewsAction extends AdminsBaseAction implements ModelDriven<PageViews>{
	private PageViews pageView = new PageViews();
	@Override
	public PageViews getModel() {
		// TODO 自动生成的方法存根
		return pageView;
	}
	
	//配置service
	private ViewsServiceI viewsService;
	public ViewsServiceI getViewsService() {
		return viewsService;
	}
	@Autowired
	public void setViewsService(ViewsServiceI viewsService) {
		this.viewsService = viewsService;
	}
	
	/*************************后台管理方法********************************/
	/**
	 *  获取景区管理的数据
	 */
	public void getViewsDatagrid(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON<PageViews> retJSON = new ReturnJSON<PageViews>();
		try {
			//执行事务
			retJSON = viewsService.getViewsDatagrid(pageView,onlineAdmin);
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
	 * 获取指定id的景区的图片的imgs对象
	 */
	public void getViewImgsDatagridById(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON<PageImgs> retJSON = new ReturnJSON<PageImgs>();
		try {
			retJSON  = viewsService.getViewImgsDatagrid(pageView,onlineAdmin);
			retJSON.setMsg("");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg("");
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 根据 图片名字 获取图片
	 */
	public void getViewImgsByImgName(){
		String imgName = pageView.getImgName();
		//景区资源图片路径
		String viewsImgPath = Static.viewsImgPath;
		//请求的图片资源
		String imgDir = viewsImgPath + File.separator+imgName;
		File imgFile = new File(imgDir);
		writeImg(imgFile);
	}
	
	/**
	 * 删除景区的一张图片
	 */
	public void deleteViewImg(){	
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();	
		ReturnJSON retJSON = new ReturnJSON();
		try {
			//执行事务
			viewsService.deleteViewImg(pageView,onlineAdmin);
			retJSON.setMsg("删除成功！");
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
	
	
	
	/**
	 * 删除景区
	 */
	public void deleteView(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();	
		//执行事务
		try {
			viewsService.deleteView(pageView,onlineAdmin);
			retJSON.setMsg("删除成功！");
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
	/**
	 * 更新景区信息
	 */
	public void updateView(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();	
		//执行事务
		try {
			viewsService.updateView(pageView,onlineAdmin);
			retJSON.setMsg("编辑成功！");
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
	
	public void getOneViewDatagrid(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON<PageViews> retJSON = new ReturnJSON<PageViews>();
		try {
			retJSON = viewsService.getOneView(pageView,onlineAdmin);
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
	
	/**
	 * 获取景区名称(景区介绍添加时用到 已经有景区介绍的 就不会显示 1对1的关系)
	 */
	public void getViewsName(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();	
		
		try {
			retJSON = viewsService.getViewsName(pageView,onlineAdmin);
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
	
	public void getViewsAllName(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();	
			try {
				retJSON = viewsService.getViewsAllName(pageView,onlineAdmin);
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
