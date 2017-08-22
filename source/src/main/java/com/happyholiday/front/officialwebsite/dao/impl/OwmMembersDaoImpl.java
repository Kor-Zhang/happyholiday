package com.happyholiday.front.officialwebsite.dao.impl;

import java.io.Serializable;
import java.security.acl.Owner;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.alibaba.druid.filter.AutoLoad;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.officialwebsite.dao.OwIndexCarouselDaoI;
import com.happyholiday.front.officialwebsite.dao.OwMembersDaoI;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
import com.happyholiday.model.OfficialwebsiteMembers;
@Repository(value="owmMembersDao")
public class OwmMembersDaoImpl extends BaseDaoImpl<OfficialwebsiteMembers> implements OwMembersDaoI{
	
}
