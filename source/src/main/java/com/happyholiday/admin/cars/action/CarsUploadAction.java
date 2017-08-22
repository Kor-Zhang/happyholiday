package com.happyholiday.admin.cars.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.print.attribute.standard.Severity;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.compass.core.support.search.CompassSearchResults.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCarImgUpload;
import com.happyholiday.admin.cars.pageModel.PageCarUpload;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.service.CarsServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.service.AdminLoginRecordServiceI;
import com.happyholiday.admin.service.AdminUpdateRecordServiceI;
import com.happyholiday.admin.service.AdminsServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.util.SessionMap;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 在struts2.xml中配置
 * 添加car
 * @author Jhon
 * 
 */

public class CarsUploadAction extends ActionSupport implements ModelDriven<PageCarUpload> {
	
	private PageCarUpload pageModel = new PageCarUpload();
	@Override
	public PageCarUpload getModel() {
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


	public void addCar(){
		BackReturnJSON retJSON = new BackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
			carsService.addCar(onlineAdmin,pageModel);
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
