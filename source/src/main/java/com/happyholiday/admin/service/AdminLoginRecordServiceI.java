package com.happyholiday.admin.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdminLoginRecord;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Adminloginrecord;
import com.happyholiday.model.Admins;


public interface AdminLoginRecordServiceI {

	/**
	 * 更新登出时间
	 * @param alr
	 */
	void updateLogoffTime(Adminloginrecord alr);
	/**
	 * 获取datagrid
	 * @param onlineAdmin
	 * @param pageAdminLoginRecord
	 * @return
	 * @throws Exception 
	 */
	BackReturnJSON<PageAdminLoginRecord> getDatagrid(Admins onlineAdmin,PageAdminLoginRecord pageAdminLoginRecord) throws AdminsException, Exception;
	
}
