package com.happyholiday.front.car.service;

import java.util.List;

import com.happyholiday.front.car.pageModel.PageOrder;
import com.happyholiday.model.Orders;

public interface CarOrderServiceI {
	 /**
	  * 下订单方法
	  * @param pageOrder
	  * @throws Exception
	  */
		Orders saveOrder(PageOrder pageOrder) throws Exception;		
		List<PageOrder> getOrders(PageOrder pageOrder) throws Exception;
		void cancelOrder(PageOrder pageOrder) throws Exception;
}
