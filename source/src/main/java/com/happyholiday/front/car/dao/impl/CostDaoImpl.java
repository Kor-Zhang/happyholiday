package com.happyholiday.front.car.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.front.car.dao.CostDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Cost;
@Repository("frontCarCostDao")
public class CostDaoImpl  extends BaseDaoImpl<Cost> implements CostDaoI{

}
