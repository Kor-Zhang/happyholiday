package com.happyholiday.admin.officialwebsite.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.officialwebsite.dao.OwMembersBackDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.OfficialwebsiteMembers;
@Repository(value="owMembersBackDao")
public class OwMembersBackDaoImpl extends BaseDaoImpl<OfficialwebsiteMembers> implements OwMembersBackDaoI{
	
}
