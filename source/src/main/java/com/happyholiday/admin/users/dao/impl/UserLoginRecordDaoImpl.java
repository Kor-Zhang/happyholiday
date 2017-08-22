package com.happyholiday.admin.users.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.users.dao.UserLoginRecordDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Userloginrecord;
import com.happyholiday.model.Userupdaterecord;
@Repository("userLoginRecordDao")
public class UserLoginRecordDaoImpl extends BaseDaoImpl<Userloginrecord> implements UserLoginRecordDaoI{
	
} 
 