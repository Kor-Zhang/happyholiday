package com.happyholiday.admin.cars.action;

import java.io.File;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCarImgs;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.cars.service.CarImgsServiceI;
import com.happyholiday.admin.cars.service.CarsServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "carImgsAction")

public class CarImgsAction extends AdminsBaseAction implements ModelDriven<PageCarImgs> {

	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CarImgsAction.class);
	private PageCarImgs pageModel = new PageCarImgs();

	@Override
	public PageCarImgs getModel() {
		return pageModel;
	}
	

	
	//注入carImgService
	private CarImgsServiceI carImgsService;
	
	public CarImgsServiceI getCarImgsService() {
		return carImgsService;
	}
	@Autowired
	public void setCarImgsService(CarImgsServiceI carImgsService) {
		this.carImgsService = carImgsService;
	}
	
	/**
	 * 设置指定的carimg的为car的主要图片
	 */
	public void setMainImg(){
		
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			carImgsService.setMainImg(onlineAdmin,pageModel);
		} catch (Exception e) {
			e.printStackTrace();
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
		} finally {

			super.writeJSON(retJSON);

		}
	}
}
