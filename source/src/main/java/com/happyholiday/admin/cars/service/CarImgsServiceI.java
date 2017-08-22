package com.happyholiday.admin.cars.service;

import java.io.Serializable;

import com.happyholiday.admin.cars.pageModel.PageCarImgs;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface CarImgsServiceI {

	void setMainImg(Admins onlineAdmin, PageCarImgs pageModel) throws AdminsException, Exception;
	
}
