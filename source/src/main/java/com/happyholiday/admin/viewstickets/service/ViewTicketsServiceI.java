package com.happyholiday.admin.viewstickets.service;

import com.happyholiday.admin.viewstickets.pageModel.PageViewTickets;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;

public interface ViewTicketsServiceI {
		ReturnJSON<PageViewTickets> getViewTicketsDatagrid(PageViewTickets pageViewTickets,Admins onlineAdmin) throws Exception;
		void addViewTicket(PageViewTickets pageModel,Admins onlineAdmin) throws Exception;
		void deleteViewTicket(PageViewTickets pageModel,Admins onlineAdmin) throws Exception;
		void updateViewTicket(PageViewTickets pageModel,Admins onlineAdmin) throws Exception;
		ReturnJSON<PageViewTickets> getOneViewTicket(PageViewTickets pageViewTickets,Admins onlineAdmin) throws Exception;
}
