package com.happyholiday.admin.viewstickets.service;

import com.happyholiday.admin.viewstickets.pageModel.PageRecommendViews;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;

public interface RecommendViewsServiceI {
	ReturnJSON<PageRecommendViews> getDatagrid(Admins onlineAdmin,PageRecommendViews pageModel) throws Exception;
	void  addRecommendView(Admins onlineAdmin,PageRecommendViews pageModel) throws Exception;
	void  deleteRecommendView(Admins onlineAdmin,PageRecommendViews pageModel) throws Exception;
}
