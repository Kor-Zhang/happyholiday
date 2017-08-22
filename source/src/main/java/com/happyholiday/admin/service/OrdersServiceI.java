package com.happyholiday.admin.service;

import com.happyholiday.admin.cars.exception.CarsException;
import com.happyholiday.admin.cars.pageModel.PageCarImgUpload;
import com.happyholiday.admin.cars.pageModel.PageCarUpload;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.cars.pageModel.PageOrders;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.OrdersException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface OrdersServiceI {
	
	BackReturnJSON<PageOrders> getOrdersDatagrid(Admins onlineAdmin,
			PageOrders pageModel) throws AdminsException, Exception ;
	void updateOrdersStatus(Admins onlineAdmin, PageOrders pageModel) throws AdminsException, OrdersException, Exception ;
	void updateOrdersAdminNote(Admins onlineAdmin,
			PageOrders pageModel) throws AdminsException, Exception;
	BackReturnJSON<PageRentCarCost> getCostDataByOrderId(Admins onlineAdmin, PageOrders pageModel) throws AdminsException, Exception;
	
}
