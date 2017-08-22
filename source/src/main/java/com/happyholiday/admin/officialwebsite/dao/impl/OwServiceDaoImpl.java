package com.happyholiday.admin.officialwebsite.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.officialwebsite.dao.OwServiceBackDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.OfficialwebsiteService;
@Repository(value="OwServiceBackDao")
public class OwServiceDaoImpl extends BaseDaoImpl<OfficialwebsiteService> implements OwServiceBackDaoI{
	
}
