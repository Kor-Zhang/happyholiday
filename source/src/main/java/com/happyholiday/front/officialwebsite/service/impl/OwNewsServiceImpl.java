package com.happyholiday.front.officialwebsite.service.impl;

import java.security.acl.Owner;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.util.BackTools;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.dao.OwIndexCarouselDaoI;
import com.happyholiday.front.officialwebsite.dao.OwNewsDaoI;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexCarousel;
import com.happyholiday.front.officialwebsite.pageModel.PageOwNews;
import com.happyholiday.front.officialwebsite.service.OwIndexCarouselServiceI;
import com.happyholiday.front.officialwebsite.service.OwNewsServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
import com.happyholiday.model.OfficialwebsiteNews;
@Service(value="owNewsService")
public class OwNewsServiceImpl implements OwNewsServiceI{
	//注入owNewsDao
	private OwNewsDaoI owNewsDao;
	
	public OwNewsDaoI getOwNewsDao() {
		return owNewsDao;
	}
	@Autowired
	public void setOwNewsDao(OwNewsDaoI owNewsDao) {
		this.owNewsDao = owNewsDao;
	}

	@Override
	public OwFrontReturnJSON<PageOwNews> getNews(PageOwNews pageModel)
			throws OfficialwebsiteException {
		OwFrontReturnJSON<PageOwNews> retJSON = new OwFrontReturnJSON<PageOwNews>();
		List<OfficialwebsiteNews> tempRows = owNewsDao.get("from "+OwFrontStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_NEWS+" t where t.isDelete=false and t.status=1 order by createTime desc ", pageModel.getPage(), pageModel.getRows());
		List<PageOwNews> rows = OwFrontTools.copyPropertiesList(tempRows,PageOwNews.class);
		retJSON.setRows(rows);
		Integer length = owNewsDao.length("select count(*) from "+OwFrontStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_NEWS+" t where t.isDelete=false and t.status=1 ");
		retJSON.setTotal(length);
		return retJSON;
	}
	
}
