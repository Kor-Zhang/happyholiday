package com.happyholiday.admin.cars.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.cars.dao.CarsDaoI;
import com.happyholiday.admin.cars.dao.RentCarUsersDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Rentcarusers;
@Repository("rentCarUsersDao")
public class RentCarUsersDaoImpl extends BaseDaoImpl<Rentcarusers> implements RentCarUsersDaoI{
	
}
