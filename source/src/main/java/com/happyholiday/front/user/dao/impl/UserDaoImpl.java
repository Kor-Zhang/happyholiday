package com.happyholiday.front.user.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.user.dao.UserDaoI;
import com.happyholiday.model.Users;
@Repository("frontUserDao")
public class UserDaoImpl extends BaseDaoImpl<Users> implements UserDaoI{

}
