package com.happyholiday.front.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.viewstickets.dao.UserDaoI;
import com.happyholiday.model.Users;
@Repository("viewUserdao")
public class UserDaoImpl extends BaseDaoImpl<Users> implements UserDaoI{

}
