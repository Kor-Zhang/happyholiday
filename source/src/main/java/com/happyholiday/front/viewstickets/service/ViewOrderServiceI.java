package com.happyholiday.front.viewstickets.service;



import com.happyholiday.front.viewstickets.pageModel.PageViewOrder;
import com.happyholiday.front.viewstickets.util.ReturnJSON;

public interface ViewOrderServiceI {
	void addOrder(PageViewOrder pageModel) throws Exception;
	ReturnJSON<PageViewOrder> getOrders(PageViewOrder pageModel) throws Exception;
	void cancelOrder(PageViewOrder pageModel) throws Exception;
}
