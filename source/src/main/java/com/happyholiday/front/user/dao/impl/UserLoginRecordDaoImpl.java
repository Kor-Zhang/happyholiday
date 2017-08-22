package com.happyholiday.front.user.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.user.dao.UserLoginRecordDaoI;
import com.happyholiday.model.Userloginrecord;
@Repository("frontUserLoginRecordDao")
public class UserLoginRecordDaoImpl extends BaseDaoImpl<Userloginrecord> implements UserLoginRecordDaoI{

}
