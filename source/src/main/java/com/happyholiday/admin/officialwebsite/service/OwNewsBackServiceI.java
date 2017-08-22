package com.happyholiday.admin.officialwebsite.service;

import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexCarouselBack;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwNewsBack;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.model.Admins;


public interface OwNewsBackServiceI {

	void uploadTextNews(Admins onlineAdmin, PageOwNewsBack pageModel) throws Exception;

	OwBackReturnJSON<PageOwNewsBack> getDatagrid(Admins onlineAdmin,
			PageOwNewsBack pageModel) throws Exception;

	void deleteNews(Admins onlineAdmin, PageOwNewsBack pageModel) throws Exception;

	void updateTextNews(Admins onlineAdmin, PageOwNewsBack pageModel)
			throws Exception;

}
