package com.happyholiday.admin.officialwebsite.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.officialwebsite.dao.OwNewsBackDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.OfficialwebsiteNews;
@Repository(value="owNewsBackDao")
public class OwNewsBackDaoImpl extends BaseDaoImpl<OfficialwebsiteNews> implements OwNewsBackDaoI{
	
}
