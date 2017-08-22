package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.ViewTicketsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketTickets;
@Repository("viewTicketsdao")
public class ViewTicketsDaoImpl extends BaseDaoImpl<ViewticketTickets> implements ViewTicketsDaoI{

}
