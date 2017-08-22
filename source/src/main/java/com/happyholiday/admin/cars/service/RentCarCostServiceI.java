package com.happyholiday.admin.cars.service;

import java.io.Serializable;

import com.happyholiday.admin.cars.pageModel.PageCarImgs;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface RentCarCostServiceI {

	BackReturnJSON<PageRentCarCost> getDatagrid(Admins onlineAdmin,
			PageRentCarCost pageModel) throws AdminsException, Exception;

	

	
}
