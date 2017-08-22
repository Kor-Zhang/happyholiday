package com.happyholiday.front.car.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.CarsBaseAction;
import com.happyholiday.front.car.pageModel.PageCost;
import com.happyholiday.front.car.service.CostServiceI;
import com.happyholiday.front.car.util.Tools;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontCarCostAction", results={
		})
public class CostAction extends CarsBaseAction implements ModelDriven<PageCost>{
	private PageCost pageCost = new PageCost();
	@Override
	public PageCost getModel() {
		// TODO 自动生成的方法存根
		return pageCost;
	}
	
	//配置service
	private CostServiceI frontCarCostService;
	public CostServiceI getFrontCarCostService() {
		return frontCarCostService;
	}
	@Autowired
	public void setFrontCarCostService(CostServiceI frontCarCostService) {
		this.frontCarCostService = frontCarCostService;
	}
	
	public void getCostInfo(){
		
		try {
			List<PageCost> cost= frontCarCostService.getCostInfo();
			System.out.println("cost:"+cost);
			Tools.getSession().setAttribute("carCostInfo", cost);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
