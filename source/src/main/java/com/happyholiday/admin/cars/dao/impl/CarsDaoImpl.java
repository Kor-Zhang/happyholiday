package com.happyholiday.admin.cars.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.cars.dao.CarsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Cars;
@Repository("carsDao")
public class CarsDaoImpl extends BaseDaoImpl<Cars> implements CarsDaoI{
	
}
