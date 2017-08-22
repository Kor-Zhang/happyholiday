package com.happyholiday.admin.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdminUpdateRecord;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;


public interface AdminUpdateRecordServiceI {

	BackReturnJSON<PageAdminUpdateRecord> getDatagrid(Admins onlineAdmin,
			PageAdminUpdateRecord pageAdminUpdateRecord) throws AdminsException, Exception;

	
}
