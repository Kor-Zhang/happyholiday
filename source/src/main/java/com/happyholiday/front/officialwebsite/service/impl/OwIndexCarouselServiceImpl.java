package com.happyholiday.front.officialwebsite.service.impl;

import java.security.acl.Owner;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.dao.OwIndexCarouselDaoI;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexCarousel;
import com.happyholiday.front.officialwebsite.service.OwIndexCarouselServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
@Service(value="owIndexCarouselService")
public class OwIndexCarouselServiceImpl implements OwIndexCarouselServiceI{
	//注入owIndexCarouselDao
	private OwIndexCarouselDaoI owIndexCarouselDao;

	public OwIndexCarouselDaoI getOwIndexCarouselDao() {
		return owIndexCarouselDao;
	}
	@Autowired
	public void setOwIndexCarouselDao(OwIndexCarouselDaoI owIndexCarouselDao) {
		this.owIndexCarouselDao = owIndexCarouselDao;
	}
	@Override
	public List<PageOwIndexCarousel> getCarousels(PageOwIndexCarousel pageModel)
			throws OfficialwebsiteException {
		List<OfficialwebsiteIndexCarousel> tempRows = owIndexCarouselDao.get("from "+OwFrontStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_IDNEX_CAROUSEL+" t where t.status=1 and t.isDelete=false");
		List<PageOwIndexCarousel> rows = OwFrontTools.copyPropertiesList(tempRows,PageOwIndexCarousel.class);
		
		return rows;
	}
	
}
