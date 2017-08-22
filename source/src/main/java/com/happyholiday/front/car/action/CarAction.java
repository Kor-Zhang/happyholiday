package com.happyholiday.front.car.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.CarsBaseAction;
import com.happyholiday.front.car.Static;
import com.happyholiday.front.car.pageModel.PageCars;
import com.happyholiday.front.car.service.CarsServiceI;
import com.happyholiday.front.car.util.Tools;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontCarsAction", results={
		@Result(name = "get_success", location = "/cars/car_Info.jsp"),
		})
public class CarAction extends CarsBaseAction implements ModelDriven<PageCars> {
	private PageCars pageCar = new PageCars();
	@Override
	public PageCars getModel() {
		return pageCar;
	}
	
	//配置carsService
	private CarsServiceI frontCarsService;
	
	public CarsServiceI getFrontCarsService() {
		return frontCarsService;
	}
	@Autowired
	public void setFrontCarsService(CarsServiceI frontCarsService) {
		this.frontCarsService = frontCarsService;
	}

	/**
	 * 根据条件 查找车的集合
	 */
	public void selectCarsInfo(){
		 JSONObject jo =new JSONObject();
		try {
			List<PageCars> cars = frontCarsService.selectInfo(pageCar);
		
			System.out.println("cars"+cars);
			if(cars.size()==0){
				String carInfoMsg ="未找到该车型";
				Tools.getSession().setAttribute("carInfoMsg", carInfoMsg);
			}
			Tools.getSession().setAttribute(Static.CarsInfo, cars);
			jo.put("rows", cars);
			jo.put("total", cars.size());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ServletActionContext.getRequest().setAttribute("carInfoMsg", e.getMessage());
		}
		 super.writeJSON(jo.toJSONString());
	}
	/**
	 * 返回该条件的汽车总共多少辆 
	 */
	public  void selectCarsSize(){
		 JSONObject jo =new JSONObject();
			try {
				    int size = frontCarsService.selectInfoSize(pageCar);
					jo.put("total",size);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				ServletActionContext.getRequest().setAttribute("carInfoMsg", e.getMessage());
			}
			 super.writeJSON(jo.toJSONString());
	}
	
	/**
	 * 获取 一辆汽车的所有信息 包括传来的时间 地点
	 */
	public String getCarInfo(){

			try {
			    PageCars car = frontCarsService.selectCarInfo(pageCar);
				Tools.getSession().setAttribute("orderCarInfo",car);
				return "get_success";
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				return "get_false";
			}
	}
	
	
	/**
	 * 获取汽车图片
	 */
	 public void getCarsImg(){
			  String imgName = pageCar.getMainImgName();
			  //汽车图片目录
			  String carsImgPath = Static.carsImgPath;
			//请求的图片资源
			  String imgDir = carsImgPath+File.separator+imgName;
			  File imgFile = new File(imgDir);
			  if(imgName.equals("")||!imgFile.exists()){
				  imgDir = carsImgPath+File.separator+"default.png";
				  imgFile = new File(imgDir);
			  }
			  writeImg(imgFile);
	 }
}
