package com.happyholiday.admin.cars.service;

import com.happyholiday.admin.cars.exception.CarsException;
import com.happyholiday.admin.cars.pageModel.PageCarImgUpload;
import com.happyholiday.admin.cars.pageModel.PageCarUpload;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface CarsServiceI {
	public static final String CARSDAO = "com.happyholiday.rentcar.service.impl.BGCarsServiceImpl";
	BackReturnJSON<PageCars> getDatagrid(Admins onlineAdmin, PageCars bGPageCar) throws AdminsException, Exception;

	void addCar(Admins onlineAdmin, PageCarUpload pageModel) throws CarsException,AdminsException, Exception;

	BackReturnJSON<PageImgs> getCarsImgDatagrid(Admins onlineAdmin,
			PageCars pageCar) throws AdminsException, Exception;

	void deleteCarImgs(Admins onlineAdmin, PageCars pageCar) throws AdminsException, Exception;

	void addCarImg(Admins onlineAdmin, PageCarImgUpload pageModel) throws AdminsException, CarsException, Exception;

	void deleteCars(Admins onlineAdmin, PageCars pageCar) throws AdminsException, Exception;

	void updateCar(Admins onlineAdmin, PageCars pageCar) throws AdminsException, Exception;

	BackReturnJSON<PageCars> getSingleCarDatagridById(Admins onlineAdmin,
			PageCars pageCar) throws AdminsException, Exception;

	
}
