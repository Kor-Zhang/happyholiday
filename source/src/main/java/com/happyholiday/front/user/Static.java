package com.happyholiday.front.user;

import java.io.File;

import org.apache.log4j.Logger;

import com.happyholiday.front.user.util.Config;

public class Static {
	//logger对象
	public static final Logger log = Logger.getLogger(Static.class);

	/*************************************admin模块**********************************/
	//session中保存的管理员们的name
	public static final String onlineAdminSessionName = "admin";
	//app中map的name
	public static final String adminLoginRecordSessionMapName = "adminLoginRecordMap";
	//session中保存的管理员的登陆记录name
	public static final String adminLoginRecordSessionName = "adminLoginRecord";
	/*************************************car模块**********************************/
	//session中保存的user
	public static final String ONLINE_USER = "user";
	//session中保存的cars
	public static final String CarsInfo ="cars";
	//session中保存的CarouselsInfo 图片轮播信息
	public static final String CarouselsInfo = "carouselsInfo";

	//session 中保存的用户的登录记录name
	public static final String userLoginRecordSessionName = "userLoginRecord";
	//项目资源路径，即src的路径
	public static final String srcPath = Config.getPro().getProperty("uploadDirectory")+File.separator+"src";
	//图片资源路径
	public static final String imgPath = srcPath+File.separator+"img";
	//首页图片资源路径
	public static final String indexPath = imgPath+File.separator+"indexCarouselImg";
	//汽车图片资源路径
	public static final String carsImgPath = imgPath + File.separator+"carsImg";
	//用户头像资源路径
	public static final String USERS_HEAD_PATH = imgPath + File.separator+"usersHeadImg";
	//酒店图片资源路径
	public static final String hotelsImgPath = imgPath + File.separator+"hotelsImg";
	/*************************************租车订单状态*****************************************/
	//订单状态：0代表用户已下订单，车辆未提取；1代表车辆提取未归还；2代表车辆已归还；-1代表用户取消订单
	public static final Integer ORDER_STATUS_UNDEAL = 0;
	//1代表车辆提取未归还；
	public static final Integer ORDER_STATUS_GETCAR = 1;
	//2代表车辆已归还；
	public static final Integer ORDER_STATUS_RETURNCAR = 2;
	//-1代表用户取消订单
	public static final Integer ORDER_STATUS_USER_CANCEL = -1;
	//-2代表管理员取消订单
	public static final Integer ORDER_STATUS_ADMIN_CANCEL = -2;

	
}
