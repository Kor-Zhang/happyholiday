package com.happyholiday.front.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.viewstickets.dao.ViewOrderDaoI;
import com.happyholiday.model.ViewticketOrders;
@Repository("frontViewOrderdao")
public class ViewOrderDaoImpl extends BaseDaoImpl<ViewticketOrders> implements ViewOrderDaoI{

}
