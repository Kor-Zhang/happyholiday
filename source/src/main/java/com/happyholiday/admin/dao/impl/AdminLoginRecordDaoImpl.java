package com.happyholiday.admin.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.dao.AdminLoginRecordDaoI;
import com.happyholiday.admin.dao.AdminUpdateRecordDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Adminloginrecord;
import com.happyholiday.model.Adminupdaterecord;
@Repository("adminLoginRecordDao")
public class AdminLoginRecordDaoImpl extends BaseDaoImpl<Adminloginrecord> implements AdminLoginRecordDaoI{
	
}
 