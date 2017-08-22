package com.happyholiday.admin.listener;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.action.AdminsAction;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.service.AdminLoginRecordServiceI;
import com.happyholiday.admin.service.AdminsServiceI;
import com.happyholiday.admin.service.RepairServiceI;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Adminloginrecord;

/**
 * session销毁时，更新admin登出记录
 *@author Jhon
 * 
 */
public class AdminLogoffListener implements HttpSessionListener{
	
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(AdminLogoffListener.class);

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		//获取bean
		AdminLoginRecordServiceI adminLoginRecordService = BackTools.getSpringBean("adminLoginRecordService",se.getSession().getServletContext());
		//获取即将销毁的session中的adminLoginRecord
		HttpSession session = se.getSession();
		Adminloginrecord alr = (Adminloginrecord) session.getAttribute(BackStatic.adminLoginRecordSessionName);
		//移除sessionmap的session
		AdminsAction.adminsSessionMap.removeAttribute(alr.getAdmins().getId());;
		//判断是否含有adminLoginRecord
		if(alr!=null){
			//含有，更新登出时间
			alr.setLogoffTime(new Timestamp(new Date().getTime()));
			adminLoginRecordService.updateLogoffTime(alr);
			
			logger.info(alr.getLogoffTime()+"，"+alr.getAdmins().getId()+"在"+alr.getLoginAddress()+"登出！");
		}
		
	}
	

}
