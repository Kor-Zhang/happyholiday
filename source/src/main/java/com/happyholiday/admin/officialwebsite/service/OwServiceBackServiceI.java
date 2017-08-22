package com.happyholiday.admin.officialwebsite.service;

import com.happyholiday.admin.officialwebsite.pageModel.PageOwServiceBack;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.model.Admins;


public interface OwServiceBackServiceI {

	OwBackReturnJSON<PageOwServiceBack> getDatagrid(Admins onlineAdmin,
			PageOwServiceBack pageModel) throws Exception;

	void uploadTextService(Admins onlineAdmin, PageOwServiceBack pageModel) throws Exception;

	void updateTextService(Admins onlineAdmin, PageOwServiceBack pageModel) throws Exception;

	void deleteService(Admins onlineAdmin, PageOwServiceBack pageModel) throws Exception;

	

	
}
