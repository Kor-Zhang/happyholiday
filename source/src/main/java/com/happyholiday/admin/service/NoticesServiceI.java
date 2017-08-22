package com.happyholiday.admin.service;

import java.io.Serializable;
import java.util.List;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.NoticesException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.pageModel.PageNotices;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface NoticesServiceI {

	void addNotices(Admins onlineAdmin, PageNotices pageModel) throws AdminsException, Exception;

	BackReturnJSON<PageNotices> getNoticesDatagrid(Admins onlineAdmin, PageNotices pageModel) throws AdminsException, Exception;

	void editNotices(Admins onlineAdmin,
			PageNotices pageModel) throws AdminsException, Exception;

	void deleteNotices(Admins onlineAdmin, PageNotices pageModel) throws AdminsException, Exception;

	PageNotices getSingleNoticeDatagridById(PageNotices pageModel) throws AdminsException, NoticesException ;

	List<PageNotices> getNoticesList(PageNotices pageModel)
			throws AdminsException;
}
