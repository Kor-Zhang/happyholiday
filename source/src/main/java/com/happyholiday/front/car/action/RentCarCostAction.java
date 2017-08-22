package com.happyholiday.front.car.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.CarsBaseAction;
import com.happyholiday.front.car.pageModel.PageRentCarCost;
import com.happyholiday.front.car.service.RentCarCostServiceI;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontRentCarCostAction", results={
		})
public class RentCarCostAction extends CarsBaseAction implements ModelDriven<PageRentCarCost> {
	private PageRentCarCost  prcc = new PageRentCarCost();
	@Override
	public PageRentCarCost getModel() {
		// TODO 自动生成的方法存根
		return prcc;
	}
	
	//配置service
	private RentCarCostServiceI frontRentCarCostService;
	public RentCarCostServiceI getFrontRentCarCostService() {
		return frontRentCarCostService;
	}
    @Autowired
	public void setFrontRentCarCostService(
			RentCarCostServiceI frontRentCarCostService) {
		this.frontRentCarCostService = frontRentCarCostService;
	}
	
    public void saveCarCost(){
    	try {
			frontRentCarCostService.saveCarCostInfo(prcc);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
    }
}
