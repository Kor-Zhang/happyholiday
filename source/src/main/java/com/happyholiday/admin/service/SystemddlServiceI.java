package com.happyholiday.admin.service;

import java.util.List;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.SystemddlException;
import com.happyholiday.admin.pageModel.PageSystemddl;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;

public interface SystemddlServiceI {

	BackReturnJSON<PageSystemddl> getSystemddlRootDatagrid(Admins onlineAdmin,
			PageSystemddl pageModel) throws AdminsException, Exception;
  
	List<PageSystemddl> getSystemddlByParentId(Admins onlineAdmin,
			String id) throws AdminsException, Exception;

	PageSystemddl addSystemddl(Admins onlineAdmin, String parentId) throws AdminsException,SystemddlException, Exception;

	void updateSystemddl(Admins onlineAdmin, PageSystemddl pageModel)throws AdminsException,SystemddlException, Exception;

	void deleteSystemddl(Admins onlineAdmin, PageSystemddl pageModel) throws AdminsException,SystemddlException, Exception ;



}
