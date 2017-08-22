package com.happyholiday.front.officialwebsite.service.impl;

import java.security.acl.Owner;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.dao.OwIndexCarouselDaoI;
import com.happyholiday.front.officialwebsite.dao.OwMembersDaoI;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexCarousel;
import com.happyholiday.front.officialwebsite.pageModel.PageOwMembers;
import com.happyholiday.front.officialwebsite.service.OwIndexCarouselServiceI;
import com.happyholiday.front.officialwebsite.service.OwMembersServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
import com.happyholiday.model.OfficialwebsiteMembers;
@Service(value="owMembersService")
public class OwMembersServiceImpl implements OwMembersServiceI{
	//注入owMembersDao
	private OwMembersDaoI owMembersDao;

	
	public OwMembersDaoI getOwMembersDao() {
		return owMembersDao;
	}

	@Autowired
	public void setOwMembersDao(OwMembersDaoI owMembersDao) {
		this.owMembersDao = owMembersDao;
	}


	@Override
	public List<PageOwMembers> getMembers(PageOwMembers pageModel)
			throws OfficialwebsiteException {
		List<OfficialwebsiteMembers> tempRows = owMembersDao.get("from "+OwFrontStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_MEMBERS+" t where t.status=1 and t.isDelete=false");
		List<PageOwMembers> rows = OwFrontTools.copyPropertiesList(tempRows,PageOwMembers.class);
		
		return rows;
	}
	
}
