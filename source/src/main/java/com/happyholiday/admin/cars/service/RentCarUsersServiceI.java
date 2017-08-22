package com.happyholiday.admin.cars.service;

import com.happyholiday.admin.cars.pageModel.PageRentCarUsers;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.exception.UsersException;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.users.pageModel.PageUsersUpload;
import com.happyholiday.admin.users.pageModel.PageUsersUploadHead;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Users;

public interface RentCarUsersServiceI {

	BackReturnJSON<PageRentCarUsers> getSingleRentCarUserDatagridById(Admins onlineAdmin,
			PageRentCarUsers pageModel) throws AdminsException;

}
