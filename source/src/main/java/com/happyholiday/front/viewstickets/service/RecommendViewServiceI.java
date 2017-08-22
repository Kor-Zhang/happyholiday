package com.happyholiday.front.viewstickets.service;

import com.happyholiday.front.viewstickets.pageModel.PageRecommendView;
import com.happyholiday.front.viewstickets.util.ReturnJSON;

public interface RecommendViewServiceI {
	ReturnJSON<PageRecommendView> getData(PageRecommendView pageModel) throws Exception;
}
