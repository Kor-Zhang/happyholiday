package com.happyholiday.admin.officialwebsite.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexDisplayBack;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.model.Admins;


public interface OwIndexDisplayBackServiceI {

	
	void deleteIndexDisplays(Admins onlineAdmin,
			PageOwIndexDisplayBack pageModel) throws AdminsException, Exception;

	OwBackReturnJSON<PageOwIndexDisplayBack> getDatagrid(Admins onlineAdmin,
			PageOwIndexDisplayBack pageModel)
			throws OfficialwebsiteBackException, Exception;

	void uploadIndexDisplay(Admins onlineAdmin, PageOwIndexDisplayBack pageModel)throws OfficialwebsiteBackException, Exception;

	void updateIndexDisplay(Admins onlineAdmin, PageOwIndexDisplayBack pageModel)throws Exception;

}
