package com.happyholiday.admin;

import java.io.File;

import org.apache.log4j.Logger;

import com.happyholiday.PubStatic;
import com.happyholiday.admin.cars.action.CarsUploadAction;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.util.BackConfig;

public class BackStatic extends PubStatic{
	
	/*************************************src资源路径**********************************/
	//session中保存的管理员们的name
	public static final String ONLINE_ADMIN = "admin";
	//app中map的name
	public static final String adminLoginRecordSessionMapName = "adminLoginRecordMap";
	//session中保存的管理员的登陆记录name
	public static final String adminLoginRecordSessionName = "adminLoginRecord";
	//汽车图片资源路径
	public static final String carsImgPath = imgPath + File.separator+"carsImg";
	//用户头像资源路径
	public static final String USERS_HEAD_PATH = imgPath + File.separator+"usersHeadImg";
	//酒店图片资源路径
	public static final String hotelsImgPath = imgPath + File.separator+"hotelsImg";
	//首页轮播资源路径
	public static final String INDEX_CAROUSEL_IMG_PATH = imgPath + File.separator+"indexCarouselImg";
	
	//管理模块的背景图片路径
	public static final String BG_ADMIN_PATH = BG_PATH + File.separator+"admin";
	//管理模块的图标图片路径
	public static final String ICON_ADMIN_PATH = ICON_PATH + File.separator+"admin";
	
	//管理员的sessionmap名字
	public static final String SESSION_MAP_ADMIN = "adminsSessionMap";
	
	//导游证件图片路径
	public static final String USERS_GUIDE_IMG_PATH = imgPath+File.separator+"userGuideImg"; 
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
	
	/****************************************表名******************************************/
	//HQL查询语句中systemddl表名
	public static final String HQL_TABLE_NAME_SYSTEMDDL = " Systemddl ";
	//HQL查询语句中notices表名
	public static final String HQL_TABLE_NAME_NOTICES = " Notices ";
	//HQL查询语句中admins表名
	public static final String HQL_TABLE_NAME_ADMINS = " Admins ";
	//HQL查询语句中cars表名
	public static final String HQL_TABLE_NAME_CARS = " Cars ";
	//HQL查询语句中orders表名
	public static final String HQL_TABLE_NAME_ORDERS = " Orders ";
	//HQL查询语句中Indexcarousels表名
	public static final String HQL_TABLE_NAME_INDEXCAROUSELS = " Indexcarousels ";
	//HQL查询语句中Recommendcars表名
	public static final String HQL_TABLE_NAME_RECOMMENDCARS = " Recommendcars ";
	//HQL查询语句中Rentcarcost表名
	public static final String HQL_TABLE_NAME_RENTCARCOST = " Rentcarcost ";
	//HQL查询语句中Cost表名
	public static final String HQL_TABLE_NAME_COST = " Cost ";
	//HQL查询语句中Powers表名
	public static final String HQL_TABLE_NAME_POWERS = " Powers ";
	//HQL查询语句中Adminpower表名
	public static final String HQL_TABLE_NAME_ADMINPOWER = " Adminpower ";
	
	
	

	//cost中car的费用标识符
	public static final String COST_CAR = "car";
	
	//权限目录与权限
	//1代表是管理员权限
	public static final Integer IS_POWER_ITEM = 1;
	//0代表不是管理员权限
	public static final Integer IS_NOT_POWER_ITEM = 0;
	
	
	
	
	//权限代码
	
	
	//权限管理的代码
	//204代表修改管理员的权限
	public static final String POWER_ID_UPDATE_ADMIN = "204";
	//203代表查看管理员的权限
	public static final String POWER_ID_QUERY_ADMIN = "203";
	//201代表删除管理员的权限
	public static final String POWER_ID_DELETE_ADMIN = "201";
	//202代表增加管理员的权限
	public static final String POWER_ID_ADD_ADMIN = "202";
	
	//权限管理的代码
	//301代表查看管理员的权限
	public static final String POWER_ID_QUERY_USER = "301";
	//302代表删除管理员的权限
	public static final String POWER_ID_DELETE_USER = "302";
	//303代表增加管理员的权限
	public static final String POWER_ID_ADD_USER = "303";
	//304代表修改管理员的权限
	public static final String POWER_ID_UPDATE_USER = "304";
	
	//公告管理的代码
	//401代表增加管理员的权限
	public static final String POWER_ID_ADD_NOTICE = "401";
	//402代表删除管理员的权限
	public static final String POWER_ID_DELETE_NOTICE = "402";
	//403代表修改管理员的权限
	public static final String POWER_ID_UPDATE_NOTICE = "403";
	//404代表查看管理员的权限
	public static final String POWER_ID_QUERY_NOTICE = "404";
	
	
	//租车费用管理的代码
	//501代表增加管理员的权限
	public static final String POWER_ID_ADD_COST = "501";
	//502代表删除管理员的权限
	public static final String POWER_ID_DELETE_COST = "502";
	//503代表查看管理员的权限
	public static final String POWER_ID_QUERY_COST = "503";
	//504代表修改管理员的权限
	public static final String POWER_ID_UPDATE_COST = "504";
	
	//汽车推荐管理的代码
	//601代表增加管理员的权限
	public static final String POWER_ID_ADD_RECOMMEND_CAR = "601";
	//602代表删除管理员的权限
	public static final String POWER_ID_DELETE_RECOMMEND_CAR = "602";
	//603代表查看管理员的权限
	public static final String POWER_ID_QUERY_RECOMMEND_CAR = "603";
	//604代表修改管理员的权限
	public static final String POWER_ID_UPDATE_RECOMMEND_CAR = "604";
	
	//首页轮播管理的代码
	//701代表查看管理员的权限
	public static final String POWER_ID_QUERY_INDEX_CAROUSEL= "701";
	//702代表删除管理员的权限
	public static final String POWER_ID_DELETE_INDEX_CAROUSEL = "702";
	//703代表修改管理员的权限
	public static final String POWER_ID_UPDATE_INDEX_CAROUSEL = "703";
	//704代表增加管理员的权限
	public static final String POWER_ID_ADD_INDEX_CAROUSEL = "704";
		
	//日志管理权限的代码
	//801代表查看管理员登录的权限
	public static final String POWER_ID_QUERY_ADMIN_LOGIN= "801";
	//802代表删除管理员更新的权限
	public static final String POWER_ID_QUERY_ADMIN_UPDATE = "802";
	//803代表修改用户登录的权限
	public static final String POWER_ID_QUERY_USER_LOGIN = "803";
	//804代表增加用户更新的权限
	public static final String POWER_ID_QUERY_USER_UPDATE = "804";
			
	//汽车管理的代码
	//901代表增加汽车的权限
	public static final String POWER_ID_ADD_CAR= "901";
	//902代表删除汽车的权限
	public static final String POWER_ID_DELETE_CAR = "902";
	//903代表查看汽车的权限
	public static final String POWER_ID_QUERY_CAR = "903";
	//904代表修改汽车的权限
	public static final String POWER_ID_UPDATE_CAR = "904";
	
	//订单管理的代码
	//101代表查询订单的权限
	public static final String POWER_ID_QUERY_ORDER= "101";
	//102代表修改订单的权限
	public static final String POWER_ID_UPDATE_ORDER = "102";
	
	
	//字典管理的代码
	//1001代表增加汽车的权限
	public static final String POWER_ID_ADD_SYSTEMDDL= "1001";
	//1002代表删除汽车的权限
	public static final String POWER_ID_DELETE_SYSTEMDDL = "1002";
	//1003代表查看汽车的权限
	public static final String POWER_ID_QUERY_SYSTEMDDL = "1003";
	//1004代表修改汽车的权限
	public static final String POWER_ID_UPDATE_SYSTEMDDL = "1004";
	
	
	//官网成员管理的代码
	//1101代表增加官网成员的权限
	public static final String POWER_ID_ADD_MEMBERS= "1101";
	//1102代表删除官网成员的权限
	public static final String POWER_ID_DELETE_MEMBERS = "1102";
	//1103代表查看官网成员的权限
	public static final String POWER_ID_QUERY_MEMBERS = "1103";
	//1104代表修改官网成员的权限
	public static final String POWER_ID_UPDATE_MEMBERS = "1104";
	
	//官网轮播管理的代码
	//1201代表增加官网轮播的权限
	public static final String POWER_ID_ADD_CAROUSEL= "1201";
	//1202代表删除官网轮播的权限
	public static final String POWER_ID_DELETE_CAROUSEL = "1202";
	//1203代表查看官网轮播的权限
	public static final String POWER_ID_QUERY_CAROUSEL = "1203";
	//1204代表修改官网轮播的权限
	public static final String POWER_ID_UPDATE_CAROUSEL = "1204";
		
	
	//官网用户意见管理的代码
	//1301代表增加用户意见的权限
	public static final String POWER_ID_ADD_CONTACTUS= "1301";
	//1302代表删除用户意见的权限
	public static final String POWER_ID_DELETE_CONTACTUS = "1302";
	//1303代表查看用户意见的权限
	public static final String POWER_ID_QUERY_CONTACTUS = "1303";
	//1304代表修改用户意见的权限
	public static final String POWER_ID_UPDATE_CONTACTUS = "1304";
			

	//官网新闻管理的代码
	//1401代表增加新闻的权限
	public static final String POWER_ID_ADD_NEWS= "1401";
	//1402代表删除新闻的权限
	public static final String POWER_ID_DELETE_NEWS = "1402";
	//1403代表查看新闻的权限
	public static final String POWER_ID_QUERY_NEWS = "1403";
	//1404代表修改新闻的权限
	public static final String POWER_ID_UPDATE_NEWS = "1404";
	
	//官网日常展示的代码
	//1501代表增加日常展示的权限
	public static final String POWER_ID_ADD_DISPLAY= "1501";
	//1502代表删除日常展示的权限
	public static final String POWER_ID_DELETE_DISPLAY = "1502";
	//1503代表查看日常展示的权限
	public static final String POWER_ID_QUERY_DISPLAY = "1503";
	//1504代表修改日常展示的权限
	public static final String POWER_ID_UPDATE_DISPLAY = "1504";
	
	//官网业务的代码
	//1601代表增加业务的权限
	public static final String POWER_ID_ADD_SERVICE= "1601";
	//1602代表删除业务的权限
	public static final String POWER_ID_DELETE_SERVICE = "1602";
	//1603代表查看业务的权限
	public static final String POWER_ID_QUERY_SERVICE = "1603";
	//1604代表修改业务的权限
	public static final String POWER_ID_UPDATE_SERVICE = "1604";
	
	//景区介绍的代码
	//1701代表增加景区介绍的权限
	public static final String POWER_ID_ADD_VIEW_INTRO= "1701";
	//1702代表删除景区介绍的权限
	public static final String POWER_ID_DELETE_VIEW_INTRO = "1702";
	//1703代表查看景区介绍的权限
	public static final String POWER_ID_QUERY_VIEW_INTRO = "1703";
	//1704代表修改景区介绍的权限
	public static final String POWER_ID_UPDATE_VIEW_INTRO = "1704";
	
	//景区列表的代码
	//1801代表增加景区列表的权限
	public static final String POWER_ID_ADD_VIEW_LIST= "1801";
	//1802代表删除景区列表的权限
	public static final String POWER_ID_DELETE_VIEW_LIST = "1802";
	//1803代表查看景区列表的权限
	public static final String POWER_ID_QUERY_VIEW_LIST = "1803";
	//1804代表修改景区列表的权限
	public static final String POWER_ID_UPDATE_VIEW_LIST = "1804";
	
	
	//景区门票订单的代码
	//1901代表增加景区门票订单的权限
	public static final String POWER_ID_ADD_VIEWTICKET_ORDER = "1901";
	//1902代表删除景区门票订单的权限
	public static final String POWER_ID_DELETE_VIEWTICKET_ORDER = "1902";
	//1903代表查看景区门票订单的权限
	public static final String POWER_ID_QUERY_VIEWTICKET_ORDER = "1903";
	//1904代表修改景区门票订单的权限
	public static final String POWER_ID_UPDATE_VIEWTICKET_ORDER = "1904";
		
	//景区门票列表的代码
	//2001代表增加景区门票列表的权限
	public static final String POWER_ID_ADD_VIEWTICKET_LIST = "2001";
	//2002代表删除景区门票列表的权限
	public static final String POWER_ID_DELETE_VIEWTICKET_LIST = "2002";
	//2003代表查看景区门票列表的权限
	public static final String POWER_ID_QUERY_VIEWTICKET_LIST = "2003";
	//2004代表修改景区门票列表的权限
	public static final String POWER_ID_UPDATE_VIEWTICKET_LIST = "2004";
		
	
	//景区轮播的代码
	//2101代表增加景区轮播的权限
	public static final String POWER_ID_ADD_VIEW_CAROUSRL = "2101";
	//2102代表删除景区轮播的权限
	public static final String POWER_ID_DELETE_VIEW_CAROUSRL = "2102";
	//2103代表查看景区轮播的权限
	public static final String POWER_ID_QUERY_VIEW_CAROUSRL = "2103";
	//2104代表修改景区轮播的权限
	public static final String POWER_ID_UPDATE_VIEW_CAROUSRL = "2104";
	
	/*************************************car模块**********************************/
	//session中保存的cars
	public static final String CarsInfo ="cars";
	//session中保存的CarouselsInfo 图片轮播信息
	public static final String CarouselsInfo = "carouselsInfo";
	//session中保存的user
	public static final String ONLINE_USER = "user";
	//session 中保存的用户的登录记录name
	public static final String userLoginRecordSessionName = "userLoginRecord";
	//首页图片资源路径
	public static final String indexPath = imgPath+File.separator+"indexCarouselImg";
	
	
	/**********************************users的role字段取值******************************/
	//role<=0，代表普通用户
	public static final Integer USERS_ROLE_NORMAL = 0;
	//role=2，代表导游
	public static final Integer USERS_ROLE_GUIDE = 2;
	//role=1，代表正在申请导游
	public static final Integer USERS_ROLE_APPLY_GUIDE = 1;
	//role=-1，，代表申请导游被拒绝
	public static final Integer USERS_ROLE_APPLY_GUIDE_REFUSE = -1;
}
