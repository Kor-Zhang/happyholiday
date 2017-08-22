package com.happyholiday.admin.viewstickets;

import java.io.File;

import org.apache.log4j.Logger;

import com.happyholiday.admin.viewstickets.util.Config;

public class Static {
	//项目资源路径，即src的路径
	public static final String srcPath = Config.getPro().getProperty("uploadDirectory")+File.separator+"src";
	//图片资源路径
	public static final String imgPath = srcPath+File.separator+"img";
	//景区图片资源路径
	public static final String viewsImgPath = imgPath + File.separator+"viewsticketsImg";
	//景区轮播
	public static final String viewCarouselPath =  viewsImgPath +File.separator+"viewCarousels";
	
	/****订单状态***/
	public static final  Integer ORDER_STATUS_PAY = 2;   //已经付款
	public static final  Integer ORDER_STATUS_SUCCESS= 3 ;  //订单已完成
	public static final  Integer ORDER_STATUS_NOPAY = 4 ; //下单未付款
	public static final  Integer ORDER_STATUS_AMIND =  0;  //管理员取消订单
	public static final  Integer ORDER_STATUS_USER  = 1; // 用户取消
}
