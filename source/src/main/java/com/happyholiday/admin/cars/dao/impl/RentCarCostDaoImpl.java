package com.happyholiday.admin.cars.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.cars.dao.CarImgsDaoI;
import com.happyholiday.admin.cars.dao.CarsDaoI;
import com.happyholiday.admin.cars.dao.RentCarCostDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Rentcarcost;
@Repository("rentCarCostDao")
public class RentCarCostDaoImpl extends BaseDaoImpl<Rentcarcost> implements RentCarCostDaoI{
	
}
