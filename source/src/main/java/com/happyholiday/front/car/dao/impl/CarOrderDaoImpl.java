package com.happyholiday.front.car.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.front.car.dao.CarOrderDaoI;
import com.happyholiday.front.car.pageModel.PageOrder;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Orders;
@Repository("frontCarOrderDao")
public class CarOrderDaoImpl  extends BaseDaoImpl<Orders> implements CarOrderDaoI{

}
