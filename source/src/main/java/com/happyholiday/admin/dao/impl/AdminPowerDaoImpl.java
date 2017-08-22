package com.happyholiday.admin.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.cars.dao.CostDaoI;
import com.happyholiday.admin.dao.AdminPowerDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Adminpower;
import com.happyholiday.model.Cost;
@Repository("adminPowerDao")
public class AdminPowerDaoImpl extends BaseDaoImpl<Adminpower> implements AdminPowerDaoI{
	
}
