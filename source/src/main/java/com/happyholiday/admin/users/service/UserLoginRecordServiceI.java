package com.happyholiday.admin.users.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdminLoginRecord;
import com.happyholiday.admin.users.pageModel.PageUserLoginRecord;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Adminloginrecord;
import com.happyholiday.model.Admins;


public interface UserLoginRecordServiceI {

	/**
	 * 获取datagrid
	 * @param onlineAdmin
	 * @param pageModel
	 * @return
	 * @throws Exception 
	 */
	BackReturnJSON<PageUserLoginRecord> getDatagrid(Admins onlineAdmin,PageUserLoginRecord pageModel) throws AdminsException, Exception;
	
}
