package com.happyholiday.front.officialwebsite.service;

import java.util.List;

import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexCarousel;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;

public interface OwIndexCarouselServiceI {

	List<PageOwIndexCarousel> getCarousels(PageOwIndexCarousel pageModel) throws OfficialwebsiteException;
	
}
