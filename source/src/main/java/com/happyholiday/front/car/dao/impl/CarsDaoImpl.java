package com.happyholiday.front.car.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.front.car.dao.CarsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Cars;
@Repository("frontCarsDao")
public class CarsDaoImpl extends BaseDaoImpl<Cars> implements CarsDaoI {

}
