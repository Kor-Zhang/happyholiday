package com.happyholiday.admin.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.IndexCarouselsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.pageModel.PageIndexCarousels;
import com.happyholiday.admin.pageModel.PageIndexCarouselsUpload;
import com.happyholiday.admin.users.exception.UsersException;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.users.pageModel.PageUsersUpload;
import com.happyholiday.admin.users.pageModel.PageUsersUploadHead;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Users;

public interface IndexCarouselsServiceI {

	BackReturnJSON<PageIndexCarousels> getCarouselsDatagrid(Admins onlineAdmin,
			PageIndexCarousels pageModel) throws AdminsException, Exception;

	void deleteCarouselsService(Admins onlineAdmin, PageIndexCarousels pageModel) throws AdminsException, Exception;

	void carouselsUpload(Admins onlineAdmin, PageIndexCarouselsUpload pageModel) throws AdminsException, IndexCarouselsException, Exception;
}
