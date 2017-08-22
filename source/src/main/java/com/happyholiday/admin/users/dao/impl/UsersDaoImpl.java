package com.happyholiday.admin.users.dao.impl;

import org.apache.log4j.Logger;

import java.io.Serializable;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happyholiday.admin.dao.AdminsDaoI;
import com.happyholiday.admin.users.dao.UsersDaoI;
import com.happyholiday.dao.BaseDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Users;
@Repository("usersDao")
public class UsersDaoImpl extends BaseDaoImpl<Users> implements UsersDaoI{
	
}
