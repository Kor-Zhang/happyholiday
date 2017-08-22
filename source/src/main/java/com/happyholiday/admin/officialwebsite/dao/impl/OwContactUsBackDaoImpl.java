package com.happyholiday.admin.officialwebsite.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.officialwebsite.dao.OwContactUsBackDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.OfficialwebsiteContactUs;
@Repository(value="owContactUsBackDao")
public class OwContactUsBackDaoImpl extends BaseDaoImpl<OfficialwebsiteContactUs> implements OwContactUsBackDaoI{
	
}
