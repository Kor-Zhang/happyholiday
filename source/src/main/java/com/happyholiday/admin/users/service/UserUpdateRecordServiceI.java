package com.happyholiday.admin.users.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.pageModel.PageUserUpdateRecord;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;


public interface UserUpdateRecordServiceI {

	BackReturnJSON<PageUserUpdateRecord> getDatagrid(Admins onlineAdmin,
			PageUserUpdateRecord pageModel) throws AdminsException, Exception;

	
}
