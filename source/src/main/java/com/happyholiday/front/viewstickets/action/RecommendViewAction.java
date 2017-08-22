package com.happyholiday.front.viewstickets.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.ViewsTicketsBaseAction;
import com.happyholiday.front.viewstickets.pageModel.PageRecommendView;
import com.happyholiday.front.viewstickets.service.RecommendViewServiceI;
import com.happyholiday.front.viewstickets.util.ReturnJSON;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontRecommendViewAction", results={
		})
public class RecommendViewAction extends ViewsTicketsBaseAction implements ModelDriven<PageRecommendView> {
	private PageRecommendView pageModel = new PageRecommendView();
	@Override	
	public PageRecommendView getModel() {
		// TODO Auto-generated method stub
		return pageModel;
	}
	
	//配置service
	private RecommendViewServiceI frontRecommendViewservice;
	public RecommendViewServiceI getFrontRecommendViewservice() {
		return frontRecommendViewservice;
	}
	@Autowired
	public void setFrontRecommendViewservice(
			RecommendViewServiceI frontRecommendViewservice) {
		this.frontRecommendViewservice = frontRecommendViewservice;
	}
	
	public void getData(){
		ReturnJSON<PageRecommendView> retJSON = new ReturnJSON<>();
		try {
			retJSON = frontRecommendViewservice.getData(pageModel);
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
}
