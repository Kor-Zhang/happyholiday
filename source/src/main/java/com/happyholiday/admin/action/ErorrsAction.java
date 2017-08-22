package com.happyholiday.admin.action;

import java.io.File;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.cars.service.CarsServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.users.service.UsersServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */

public class ErorrsAction extends ActionSupport{

	public void uploadError(){
		BackReturnJSON retJSON = new BackReturnJSON();
		Exception e = (Exception) ActionContext.getContext().getValueStack().findValue("Exception");
		retJSON.setMsg("上传错误！");
		retJSON.setSuccess(false);
		BackTools.writeJSON(retJSON);
	}
	
}
