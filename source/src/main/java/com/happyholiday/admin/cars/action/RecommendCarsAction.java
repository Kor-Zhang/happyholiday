package com.happyholiday.admin.cars.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.standard.Severity;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.exception.RecommendCarsException;
import com.happyholiday.admin.cars.pageModel.PageRecommendCars;
import com.happyholiday.admin.cars.service.RecommendCarsServiceI;
import com.happyholiday.admin.exception.AdminLoginRecordException;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdminLoginRecord;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.service.AdminLoginRecordServiceI;
import com.happyholiday.admin.service.AdminsServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "recommendCarsAction")
public class RecommendCarsAction extends AdminsBaseAction implements ModelDriven<PageRecommendCars> {
	public PageRecommendCars pageModel = new PageRecommendCars();

	@Override
	public PageRecommendCars getModel() {
		return pageModel;
	}
	
	//注入recommednCarsService
	private RecommendCarsServiceI recommednCarsService;
	
	public RecommendCarsServiceI getRecommednCarsService() {
		return recommednCarsService;
	}
	@Autowired
	public void setRecommednCarsService(RecommendCarsServiceI recommednCarsService) {
		this.recommednCarsService = recommednCarsService;
	}



	public void getDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageRecommendCars> returnJSON = new BackReturnJSON<PageRecommendCars>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			returnJSON = recommednCarsService.getDatagrid(onlineAdmin,pageModel);
			returnJSON.setMsg("读取信息成功！");
			returnJSON.setSuccess(true);
		} catch (Exception e) {
			returnJSON.setMsg(e.getMessage());
			returnJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(returnJSON);
		}
	}
	public void getRecommendCarByImgName(){
		String imgName = pageModel.getImgName();
		//汽车图片资源目录
		String carsImgPath = BackStatic.carsImgPath;
		//请求的图片资源
		String imgDir = carsImgPath+File.separator+imgName;
		//不存在该图片
		File imgFile = new File(imgDir);
		if(imgName.equals("")||!imgFile.exists()){
			imgDir = carsImgPath+File.separator+"default.png";
			imgFile = new File(imgDir);
		}
		writeImg(imgFile);
	}
	/**
	 * 添加推荐的car
	 */
	public void addRecommendCar(){
		BackReturnJSON returnJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			recommednCarsService.addRecommendCar(onlineAdmin,pageModel);
			returnJSON.setMsg("添加信息成功！");
			returnJSON.setSuccess(true);
		} catch (Exception e) {
			returnJSON.setMsg(e.getMessage());
			returnJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(returnJSON);
		}
	}
	/**
	 * 删除推荐的car
	 */
	public void deleteRecommendCar(){
		BackReturnJSON returnJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			recommednCarsService.deleteRecommendCar(onlineAdmin,pageModel);
			returnJSON.setMsg("删除信息成功！");
			returnJSON.setSuccess(true);
		}catch (Exception e) {

			returnJSON.setMsg(e.getMessage());
			returnJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(returnJSON);
		}
	}
}
