package com.happyholiday.admin.cars.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.cars.dao.CostDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Cost;
@Repository("costDao")
public class CostDaoImpl extends BaseDaoImpl<Cost> implements CostDaoI{
	
}
