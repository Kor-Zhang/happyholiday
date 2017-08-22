package com.happyholiday.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.dao.AdminPowerDaoI;
import com.happyholiday.admin.service.AdminPowerServiceI;

@Service(value = "adminPowerService")
public class AdminPowerServiceImpl implements AdminPowerServiceI{
	//注入adminPowerDao
	private AdminPowerDaoI adminPowerDao;

	public AdminPowerDaoI getAdminPowerDao() {
		return adminPowerDao;
	}
	@Autowired
	public void setAdminPowerDao(AdminPowerDaoI adminPowerDao) {
		this.adminPowerDao = adminPowerDao;
	}
	
	
}
