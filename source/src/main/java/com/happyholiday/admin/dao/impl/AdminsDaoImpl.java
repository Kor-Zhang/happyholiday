package com.happyholiday.admin.dao.impl;

import org.apache.log4j.Logger;

import java.io.Serializable;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happyholiday.admin.dao.AdminsDaoI;
import com.happyholiday.dao.BaseDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Admins;
@Repository("adminsDao")
public class AdminsDaoImpl extends BaseDaoImpl<Admins> implements AdminsDaoI{
	
}
