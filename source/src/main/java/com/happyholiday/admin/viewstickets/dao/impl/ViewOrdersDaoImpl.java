package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.ViewOrdersDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketOrders;
@Repository("viewOrdersdao")
public class ViewOrdersDaoImpl extends BaseDaoImpl<ViewticketOrders> implements ViewOrdersDaoI {

}
