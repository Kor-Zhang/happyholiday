package com.happyholiday.admin.viewstickets.service;

import com.happyholiday.admin.viewstickets.pageModel.PageViewOrders;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;


public interface ViewOrdersServiceI {
	ReturnJSON<PageViewOrders> getViewOrdersDatagrid(PageViewOrders pageModel,Admins onlineAdmin) throws Exception;
	void updateOrdersStatus(PageViewOrders pageModel,Admins onlineAdmin) throws Exception;
}
