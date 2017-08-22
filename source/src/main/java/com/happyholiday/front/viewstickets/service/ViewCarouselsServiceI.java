package com.happyholiday.front.viewstickets.service;

import java.util.List;

import com.happyholiday.front.viewstickets.pageModel.PageViewCarousels;

public interface ViewCarouselsServiceI {
	
			List<PageViewCarousels> getCarouselsImg(PageViewCarousels pageModel) throws Exception;
			
}
