package com.happyholiday.admin.users.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.users.dao.UserUpdateRecordDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Userupdaterecord;
@Repository("userUpdateRecordDao")
public class UserUpdateRecordDaoImpl extends BaseDaoImpl<Userupdaterecord> implements UserUpdateRecordDaoI{
	
}
