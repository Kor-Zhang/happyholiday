package com.happyholiday.admin.cars.service;

import com.happyholiday.admin.cars.pageModel.PageCost;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface CostServiceI {

	BackReturnJSON<PageCost> getDatagrid(Admins onlineAdmin,
			PageCost pageModel) throws AdminsException, Exception;

	void editCost(Admins onlineAdmin,
			PageCost pageModel) throws AdminsException, Exception;

	void addCost(Admins onlineAdmin, PageCost pageModel) throws AdminsException, Exception;

	void deleteCost(Admins onlineAdmin, PageCost pageModel) throws AdminsException, Exception;
}
