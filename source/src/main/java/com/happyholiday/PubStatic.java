package com.happyholiday;

import java.io.File;

import org.apache.log4j.Logger;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.action.CarsUploadAction;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.util.BackConfig;
import com.happyholiday.util.PubTools;

public class PubStatic {
	//logger对象
	public static final Logger log = Logger.getLogger(BackStatic.class);
	/***********************************项目资源路径*******************************/
	//项目资源路径，即src的路径
	public static final String srcPath = BackConfig.getPro().getProperty("uploadDirectory")+File.separator+"src";
	//图片资源路径
	public static final String imgPath = srcPath+File.separator+"img";
	//背景图片路径
	public static final String BG_PATH = imgPath + File.separator+"bgImg";
	//图标图片路径
	public static final String ICON_PATH = imgPath + File.separator+"iconImg";
	
	
	//项目url的前段  ，即 http://localhost:8080/happyholiday_admin_officialwebsite_0.2
	public static final String WEB_BASE_PATH = PubTools.getReq().getScheme()+"://"+PubTools.getReq().getServerName()+":"+PubTools.getReq().getServerPort()+ PubTools.getReq().getContextPath();  
	
	
	
	/*****************************状态码*************************************/
	/*************用户建议状态码*************/
	//用户提交
	public static final Integer OFFICIALWEBSITE_CONTACT_US_STATUS_SUBMITED = 0;
	//管理员受理
	public static final Integer OFFICIALWEBSITE_CONTACT_US_STATUS_RECEIVE = 1;
	//已处理（受理完毕）
	public static final Integer OFFICIALWEBSITE_CONTACT_US_STATUS_DEALED = 2;
	
	
	
	
	
	
	
	
}
