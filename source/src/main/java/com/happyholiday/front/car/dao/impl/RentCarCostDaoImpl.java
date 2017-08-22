package com.happyholiday.front.car.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.front.car.dao.RentCarCostDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Rentcarcost;
@Repository("frontRentCarCostDao")
public class RentCarCostDaoImpl  extends BaseDaoImpl<Rentcarcost> implements RentCarCostDaoI{

}
