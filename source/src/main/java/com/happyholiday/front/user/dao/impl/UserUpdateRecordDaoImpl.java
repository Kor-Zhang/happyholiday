package com.happyholiday.front.user.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.user.dao.UserUpdateRecordDaoI;
import com.happyholiday.model.Userupdaterecord;
@Repository("frontUserUpdateRecordDao")
public class UserUpdateRecordDaoImpl extends BaseDaoImpl<Userupdaterecord> implements UserUpdateRecordDaoI{

}
