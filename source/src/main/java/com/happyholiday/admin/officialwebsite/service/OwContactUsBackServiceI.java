package com.happyholiday.admin.officialwebsite.service;

import com.happyholiday.admin.officialwebsite.pageModel.PageOwContactUsBack;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.model.Admins;



public interface OwContactUsBackServiceI {


	OwBackReturnJSON<PageOwContactUsBack> getDatagrid(Admins onlineAdmin,
			PageOwContactUsBack pageModel) throws Exception;

	void deleteContactUs(Admins onlineAdmin, PageOwContactUsBack pageModel) throws Exception;

	void UpdateContactUsStatus(Admins onlineAdmin, PageOwContactUsBack pageModel)
			throws Exception;



}
