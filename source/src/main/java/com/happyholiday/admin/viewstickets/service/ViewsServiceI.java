package com.happyholiday.admin.viewstickets.service;


import com.happyholiday.admin.viewstickets.pageModel.PageImgs;
import com.happyholiday.admin.viewstickets.pageModel.PageViewImgUpload;
import com.happyholiday.admin.viewstickets.pageModel.PageViewImgs;
import com.happyholiday.admin.viewstickets.pageModel.PageViews;
import com.happyholiday.admin.viewstickets.pageModel.PageViewsUpload;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;

public interface ViewsServiceI {
		/***********后台方法
		 * @param onlineAdmin ****************/
	  ReturnJSON<PageViews>  getViewsDatagrid(PageViews pageView, Admins onlineAdmin) throws Exception;
	  ReturnJSON<PageViews> getOneView(PageViews pageView, Admins onlineAdmin) throws Exception;
	  ReturnJSON<PageImgs> getViewImgsDatagrid(PageViews pageView, Admins onlineAdmin) throws Exception;
	  void deleteViewImg(PageViews pageView, Admins onlineAdmin) throws Exception;
	  void addViewImg(PageViewImgUpload pageModel,Admins onlineAdmin) throws Exception;
	  void addView(PageViewsUpload pageModel,Admins onlineAdmin) throws Exception;
	  void deleteView(PageViews pageView, Admins onlineAdmin) throws Exception;
	  void updateView(PageViews pageView, Admins onlineAdmin) throws Exception;
	  void updateMainImg(PageViewImgs pageModel,Admins onlineAdmin) throws Exception;
	  ReturnJSON<String> getViewsName(PageViews pageView, Admins onlineAdmin) throws Exception;
	  ReturnJSON<String> getViewsAllName(PageViews pageView, Admins onlineAdmin) throws Exception;
}
