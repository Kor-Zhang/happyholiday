package com.happyholiday.front.officialwebsite;

import java.io.File;

import com.happyholiday.PubStatic;

public class OwFrontStatic extends PubStatic{
	/*************************表名*****************************/
	public static final String HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_CAROUSEL = "OfficialwebsiteIndexCarousel";
	public static final String HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_DISPLAY = "OfficialwebsiteIndexDisplay";
	public static final String HQL_TABLE_NAME_OFFICIALWEBSITE_MEMBERS = "OfficialwebsiteMembers";
	public static final String HQL_TABLE_NAME_OFFICIALWEBSITE_NEWS = "OfficialwebsiteNews";
	public static final String HQL_TABLE_NAME_OFFICIALWEBSITE_SERVICE = "OfficialwebsiteService";
	
	
	/************************官网轮播资源路径************************/
	//官网主页展示图片地址
	public static final String OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH = imgPath+File.separator+"officialwebsiteIndexDisplayImg";
	//如果官网主页展示图片不存在，那么查找名为default的图片
	public static final String OFFICIALWEBSITE_IDNEX_DISPLAY_DEFAULT_IMG_NAME = "default.png";
	//官网主页轮播图片地址
	public static final String OFFICIALWEBSITE_IDNEX_CAROUSEL_IMG_PATH = imgPath+File.separator+"officialwebsiteIndexCarouselImg";
	//如果官网主页轮播图片不存在，那么查找名为default的图片
	public static final String OFFICIALWEBSITE_IDNEX_CAROUSEL_DEFAULT_IMG_NAME = "default.png";
	//官网成员头像图片地址
	public static final String OFFICIALWEBSITE_MEMBERS_IMG_PATH = imgPath+File.separator+"officialwebsiteMembersImg";
	//如果成员头像图片不存在，那么查找名为default的图片
	public static final String OFFICIALWEBSITE_MEMBERS_DEFAULT_IMG_NAME = "default.png";
}
