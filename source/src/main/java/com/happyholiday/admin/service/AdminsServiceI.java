package com.happyholiday.admin.service;

import java.io.Serializable;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;





public interface AdminsServiceI {
	/**
	 * 用户登录
	 * @param pageUser
	 * @return
	 * @throws AdminsException
	 */
	Serializable adminRegist(PageAdmins pageUser) throws AdminsException;
	/**
	 * 用户登录
	 * @param pageUser
	 * @return object[0] 为登陆的admin，object[1]为登陆记录
	 * @throws AdminsException
	 */
	Object[] adminLogin(PageAdmins pageUser) throws AdminsException;
	/**
	 * 获取admin的datagrid
	 * @param onlineAdmin
	 * @param pageAdmin
	 * @return
	 * @throws AdminsException
	 * @throws Exception 
	 */
	BackReturnJSON<PageAdmins> getDatagrid(Admins onlineAdmin, PageAdmins pageAdmin) throws AdminsException, Exception ;
	/**
	 * 添加admin
	 * @param onlineAdmin
	 * @param pageAdmin
	 * @return
	 * @throws AdminsException
	 * @throws Exception 
	 */
	Admins addAdmin(Admins onlineAdmin, PageAdmins pageAdmin) throws AdminsException, Exception;
	/**
	 * 删除admin
	 * @param onlineAdmin
	 * @param deleteIds
	 * @throws AdminsException
	 * @throws Exception 
	 */
	void deleteAdmins(Admins onlineAdmin, String deleteIds) throws AdminsException, Exception;
	/**
	 * 获取admin
	 * @param pageAdmin
	 * @return
	 * @throws AdminsException
	 * Admins getAdmin(PageAdmins pageAdmin) throws AdminsException;
	 */
	/**
	 * 编辑admin除id，password以外的信息
	 * @param onlineAdmin
	 * @param pageAdmin
	 * @return
	 * @throws AdminsException
	 * @throws Exception 
	 */
	PageAdmins editAdmin(Admins onlineAdmin, PageAdmins pageAdmin) throws AdminsException, Exception;
	/**
	 * 编辑admin的password
	 * @param onlineAdmin
	 * @param pageAdmin
	 * @throws AdminsException
	 * @throws Exception 
	 */
	void updateAdminPwd(Admins onlineAdmin, PageAdmins pageAdmin) throws AdminsException, Exception;
	BackReturnJSON<PageAdmins> getSingleAdminDatagridById(Admins onlineAdmin,
			PageAdmins pageAdmin) throws AdminsException, Exception;
	void updateTheme(Admins onlineAdmin, PageAdmins pageAdmin) throws AdminsException;
	void updateAdminStatus(Admins onlineAdmin) throws AdminsException;
}
