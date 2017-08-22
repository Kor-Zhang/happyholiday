package com.happyholiday.front.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.front.viewstickets.dao.ViewTicketDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketTickets;
@Repository("frontViewTicketdao")
public class ViewTicketDaoImpl extends BaseDaoImpl<ViewticketTickets> implements ViewTicketDaoI {

}
