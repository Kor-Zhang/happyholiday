package com.happyholiday.admin.users.service;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.exception.UsersException;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.users.pageModel.PageUsersUpload;
import com.happyholiday.admin.users.pageModel.PageUsersUploadHead;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Users;

public interface UsersServiceI {

	BackReturnJSON<PageUsers> getDatagrid(Admins onlineAdmin, PageUsers pageModel) throws AdminsException, Exception;

	void updateHead(Admins onlineAdmin, PageUsersUploadHead pageModel)  throws AdminsException, Exception;

	void editUsers(Admins onlineAdmin, PageUsers pageModel) throws AdminsException, Exception;

	void deleteUsers(Admins onlineAdmin, PageUsers pageModel) throws AdminsException, Exception;

	void editUsersPwd(Admins onlineAdmin, PageUsers pageModel) throws AdminsException, Exception;

	void usersUpload(Admins onlineAdmin, PageUsersUpload pageModel) throws AdminsException,UsersException, Exception;
	

	BackReturnJSON<PageUsers> getSingleUserDatagridById(Admins onlineAdmin, PageUsers pageModel) throws AdminsException, Exception;

	Users getUserById(String userId);

	void editUserRole(Admins onlineAdmin, PageUsers pageModel) throws AdminsException, UsersException, Exception; 
}
