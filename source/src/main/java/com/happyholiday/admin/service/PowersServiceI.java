package com.happyholiday.admin.service;

import java.util.List;

import com.happyholiday.admin.cars.pageModel.PageCost;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PagePowers;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface PowersServiceI {

	List<PagePowers> getPowerTree(Admins onlineAdmin, PagePowers pageModel) throws AdminsException, Exception;

	void updatePowers(Admins onlineAdmin, PagePowers pageModel) throws AdminsException, Exception;

}
