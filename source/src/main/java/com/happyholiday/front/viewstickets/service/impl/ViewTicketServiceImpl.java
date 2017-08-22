package com.happyholiday.front.viewstickets.service.impl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.viewstickets.dao.ViewTicketDaoI;
import com.happyholiday.front.viewstickets.pageModel.PageViewTickets;
import com.happyholiday.front.viewstickets.service.ViewTicektServiceI;
import com.happyholiday.model.ViewticketTickets;
@Service("frontViewTicketservice")
public class ViewTicketServiceImpl  implements ViewTicektServiceI {
	//配置Dao
	private ViewTicketDaoI frontViewTicketdao;
	public ViewTicketDaoI getFrontViewTicketdao() {
		return frontViewTicketdao;
	}
	@Autowired
	public void setFrontViewTicketdao(ViewTicketDaoI frontViewTicketdao) {
		this.frontViewTicketdao = frontViewTicketdao;
	}


	@Override
	public PageViewTickets getOneTicket(PageViewTickets pageModel)
			throws Exception {
		// TODO 自动生成的方法存根
		ViewticketTickets  ticket = frontViewTicketdao.findById(ViewticketTickets.class, pageModel.getId());
		PageViewTickets  pvt = new PageViewTickets();
		BeanUtils.copyProperties(ticket, pvt);
		pvt.setViewId(ticket.getViewticketViews().getId());
		pvt.setViewName(ticket.getViewticketViews().getName());
		return pvt;
	}

}
