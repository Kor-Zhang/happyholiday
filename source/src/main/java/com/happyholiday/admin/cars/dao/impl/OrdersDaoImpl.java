package com.happyholiday.admin.cars.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.cars.dao.OrdersDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Orders;
@Repository("ordersDao")
public class OrdersDaoImpl extends BaseDaoImpl<Orders> implements OrdersDaoI{
	
}
