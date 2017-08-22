package com.happyholiday.admin.viewstickets.service;

import com.happyholiday.admin.viewstickets.pageModel.PageViewCarouselUpload;
import com.happyholiday.admin.viewstickets.pageModel.PageViewCarousels;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;

public interface ViewCarouselsServiceI {
		ReturnJSON<PageViewCarousels> getViewCarouselsDatagrid(PageViewCarousels pageModel, Admins onlineAdmin) throws Exception;
		
		void addCarouselImg(PageViewCarouselUpload pageModel,Admins onlineAdmin) throws Exception;
		
		void deleteCarouselImg(PageViewCarousels pageModel,Admins onlineAdmin) throws Exception;
		
}
