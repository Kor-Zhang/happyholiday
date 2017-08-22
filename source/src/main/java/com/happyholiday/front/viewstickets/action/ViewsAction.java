package com.happyholiday.front.viewstickets.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.ViewsTicketsBaseAction;
import com.happyholiday.front.viewstickets.Static;
import com.happyholiday.front.viewstickets.pageModel.PageViews;
import com.happyholiday.front.viewstickets.service.ViewsServiceI;
import com.happyholiday.front.viewstickets.util.ReturnJSON;
import com.happyholiday.front.viewstickets.util.Tools;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontViewsAction", results={
		@Result(name = "get_success", location = "/viewticket/viewticket.jsp"),
		})
public class ViewsAction extends ViewsTicketsBaseAction implements ModelDriven<PageViews> {
	private PageViews pageModel = new PageViews();
	@Override
	public PageViews getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	
	//配置service
	private ViewsServiceI frontViewservice;
	public ViewsServiceI getFrontViewservice() {
		return frontViewservice;
	}
	@Autowired
	public void setFrontViewservice(ViewsServiceI frontViewservice) {
		this.frontViewservice = frontViewservice;
	}
	
	public void getViewsInfo(){
		ReturnJSON<PageViews> retJSON = new ReturnJSON<>();
		ReturnJSON<PageViews> top10 = new ReturnJSON<>();
		try {
			retJSON = frontViewservice.getViewsInfo(pageModel);
			top10 = frontViewservice.getTop10(pageModel);
			//获取数据 存入session
			List<PageViews> list = retJSON.getRows();
			Tools.getSession().setAttribute("frontViews", list);
			Tools.getSession().setAttribute("viewsTotal", retJSON.getTotal());
			Tools.getSession().setAttribute("keyword", pageModel.getKeyword());
			//获取top10 存入session
			List<PageViews> viewTop = top10.getRows();
			Tools.getSession().setAttribute("top10", viewTop);
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
	
	/**
	 * 不存session
	 */
   public void getViewsList(){
	   ReturnJSON<PageViews> retJSON = new ReturnJSON<>();
		try {
			retJSON = frontViewservice.getViewsInfo(pageModel);
			//获取数据 存入session
			List<PageViews> list = retJSON.getRows();
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
   }
	
   /**
    * 获取单独的景区 
    * @return  跳转
    */
   public String getOneView(){
	   try {
			PageViews view = frontViewservice.getOneView(pageModel);
			Tools.getSession().setAttribute("oneView", view);
			Tools.getReq().setAttribute("singleView", view);
			return "get_success";
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "get_false";
		}
   }
   
   
	/**
	 * 获取图片
	 */
	public void getViewImg(){
		String imgName = pageModel.getImgName();
		//图片资源目录
		String imgPath = Static.viewsImgPath;
		String imgDir = imgPath+File.separator+imgName;
		File imgFile = new File(imgDir);
		writeImg(imgFile);
	}
}
