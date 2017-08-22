package com.happyholiday.admin.cars.service;

import java.io.Serializable;

import com.happyholiday.admin.cars.exception.RecommendCarsException;
import com.happyholiday.admin.cars.pageModel.PageRecommendCars;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface RecommendCarsServiceI {

	BackReturnJSON<PageRecommendCars> getDatagrid(Admins onlineAdmin,
			PageRecommendCars pageModel) throws AdminsException, Exception;

	void addRecommendCar(Admins onlineAdmin, PageRecommendCars pageModel) throws AdminsException, RecommendCarsException, Exception;

	void deleteRecommendCar(Admins onlineAdmin, PageRecommendCars pageModel) throws AdminsException, RecommendCarsException, Exception;
	
}
