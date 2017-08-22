package com.happyholiday.front.viewstickets.service;

import com.happyholiday.front.viewstickets.pageModel.PageViews;
import com.happyholiday.front.viewstickets.util.ReturnJSON;

public interface ViewsServiceI {
		ReturnJSON<PageViews> getViewsInfo(PageViews pageModel) throws Exception;
		PageViews getOneView(PageViews pageModel) throws Exception;
		ReturnJSON<PageViews> getTop10(PageViews pageModel) throws Exception;
}
