package com.happyholiday.admin.cars.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCarImgUpload;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.service.CarsServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CarImgUploadAction extends ActionSupport implements ModelDriven<PageCarImgUpload>  {
	private PageCarImgUpload pageModel = new PageCarImgUpload();
	@Override
	public PageCarImgUpload getModel() {
		return pageModel;
	}
	
	
	private CarsServiceI carsService;
	public CarsServiceI getCarsService() {
		return carsService;
	}
	@Autowired
	public void setCarsService(CarsServiceI carsService) {
		this.carsService = carsService;
	}
	public void addCarImg(){
		BackReturnJSON retJSON = new BackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
			carsService.addCarImg(onlineAdmin,pageModel);
			retJSON.setMsg("上传成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg("上传失败！");
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			BackTools.writeJSON(retJSON);
			
		}
        
	}
}
