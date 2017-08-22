package com.happyholiday.front.officialwebsite.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.dao.OwServiceDaoI;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwNews;
import com.happyholiday.front.officialwebsite.pageModel.PageOwService;
import com.happyholiday.front.officialwebsite.service.OwServiceServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.happyholiday.model.OfficialwebsiteNews;
import com.happyholiday.model.OfficialwebsiteService;
@Service(value="owServiceService")
public class OwServiceServiceImpl implements OwServiceServiceI{
	//注入owServiceDao
	private OwServiceDaoI owServiceDao;
	
	
	

	public OwServiceDaoI getOwServiceDao() {
		return owServiceDao;
	}
	@Autowired
	public void setOwServiceDao(OwServiceDaoI owServiceDao) {
		this.owServiceDao = owServiceDao;
	}



	@Override
	public OwFrontReturnJSON<PageOwService> getService(PageOwService pageModel)
			throws OfficialwebsiteException {
		OwFrontReturnJSON<PageOwService> retJSON = new OwFrontReturnJSON<PageOwService>();
		List<OfficialwebsiteService> tempRows = owServiceDao.get("from "+OwFrontStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_SERVICE+" t where t.isDelete=false order by createTime desc ", pageModel.getPage(), pageModel.getRows());
		List<PageOwService> rows = OwFrontTools.copyPropertiesList(tempRows,PageOwService.class);
		retJSON.setRows(rows);
		Integer length = owServiceDao.length("select count(*) from "+OwFrontStatic.HQL_TABLE_NAME_OFFICIALWEBSITE_SERVICE+" t where t.isDelete=false");
		retJSON.setTotal(length);
		return retJSON;
	}
	
}
