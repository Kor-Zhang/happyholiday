package com.happyholiday.front.officialwebsite.service.impl;

import java.security.acl.Owner;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.dao.OwIndexCarouselDaoI;
import com.happyholiday.front.officialwebsite.dao.OwIndexDisplayDaoI;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexCarousel;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexDisplay;
import com.happyholiday.front.officialwebsite.service.OwIndexCarouselServiceI;
import com.happyholiday.front.officialwebsite.service.OwIndexDisplayServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
import com.happyholiday.model.OfficialwebsiteIndexDisplay;
@Service(value="owIndexDisplayService")
public class OwIndexDisplayServiceImpl implements OwIndexDisplayServiceI{
	//注入owIndexDisplayDao
	private OwIndexDisplayDaoI owIndexDisplayDao;

	public OwIndexDisplayDaoI getOwIndexDisplayDao() {
		return owIndexDisplayDao;
	}
	@Autowired
	public void setOwIndexDisplayDao(OwIndexDisplayDaoI owIndexDisplayDao) {
		this.owIndexDisplayDao = owIndexDisplayDao;
	}
	@Override
	public List<PageOwIndexDisplay> getDisplays(PageOwIndexDisplay pageModel)
			throws OfficialwebsiteException {
		List<OfficialwebsiteIndexDisplay> tempRows = owIndexDisplayDao.get("from "+OwFrontStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_DISPLAY+" t where t.status=1 and t.isDelete=false");
		List<PageOwIndexDisplay> rows = OwFrontTools.copyPropertiesList(tempRows,PageOwIndexDisplay.class);
		return rows;
	}
	
}
