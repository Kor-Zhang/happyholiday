package com.happyholiday.admin.viewstickets.service;

import com.happyholiday.admin.viewstickets.pageModel.PageViewIntros;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;

public interface ViewIntrosServiceI {
		ReturnJSON<PageViewIntros> getViewIntrosDatagrid(PageViewIntros pageModel,Admins onlineAdmin) throws Exception; 
		void addViewIntro(PageViewIntros pageModel,Admins onlineAdmin) throws Exception;
		void deleteViewIntro(PageViewIntros pageModel,Admins onlineAdmin) throws Exception;
		void updateViewIntro(PageViewIntros pageModel,Admins onlineAdmin) throws Exception;
}
