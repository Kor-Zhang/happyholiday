package com.happyholiday.front.car.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.CarsBaseAction;
import com.happyholiday.front.car.pageModel.PageRecommendCars;
import com.happyholiday.front.car.service.RecommendCarsServiceI;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontRecommendCarsAction", results = {
		@Result(name = "success", location = "/index.jsp"),
})
public class RecommendCarsAction  extends CarsBaseAction implements ModelDriven<PageRecommendCars>{
	private PageRecommendCars prc ;
	@Override
	public PageRecommendCars getModel() {
		// TODO 自动生成的方法存根
		return prc;
	}
	
	//配置service
	private RecommendCarsServiceI frontRcmdCarService;
	public RecommendCarsServiceI getFrontRcmdCarService() {
		return frontRcmdCarService;
	}
	@Autowired
	public void setFrontRcmdCarService(RecommendCarsServiceI frontRcmdCarService) {
		this.frontRcmdCarService = frontRcmdCarService;
	}
	
	/***
	 * 利用AJAX 刷新推荐区数据
	 */
	public void getRecommendCarsInfo(){
		JSONObject jo =new JSONObject();
		try {
			List<PageRecommendCars> cars  = frontRcmdCarService.getInfo(prc);
			jo.put("rows", cars);
			jo.put("total", cars.size());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		 super.writeJSON(jo.toJSONString());
	}
	

}
