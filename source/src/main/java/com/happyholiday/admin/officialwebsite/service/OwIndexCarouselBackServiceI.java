package com.happyholiday.admin.officialwebsite.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexCarouselBack;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.model.Admins;


public interface OwIndexCarouselBackServiceI {

	OwBackReturnJSON<PageOwIndexCarouselBack> getDatagrid(Admins onlineAdmin,PageOwIndexCarouselBack pageModel) throws OfficialwebsiteBackException, Exception;

	void uploadIndexCarousel(Admins onlineAdmin,
			PageOwIndexCarouselBack pageModel) throws OfficialwebsiteBackException, Exception;

	void deleteIndexCarousels(Admins onlineAdmin, PageOwIndexCarouselBack pageModel)throws AdminsException, Exception;

	void updateIndexCarsoul(Admins onlineAdmin,
			PageOwIndexCarouselBack pageModel)throws AdminsException,OfficialwebsiteBackException, Exception;

	
}
