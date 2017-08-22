package com.happyholiday.front.user.service;

import com.happyholiday.front.user.pageModel.PageUsers;
import com.happyholiday.model.Users;

public interface UserServiceI {
	/**
	 * 用户登录后 修改密码
	 * @param pageModel
	 * @throws Exception
	 */
	void updatePwd(PageUsers pageModel) throws Exception;
	/**
	 * 更改用户信息
	 * @param pageModel
	 * @throws Exception
	 */
	void updateInfo(PageUsers pageModel) throws Exception;
	/**
	 * 下订单界面直接更新信息
	 */
	void  updateInfoByOrder(PageUsers pageModel) throws Exception;
	/**
	 * 忘记密码？
	 * @param pageModel
	 * @throws Exception
	 */
	void forgetPwd(PageUsers pageModel) throws Exception;
	/**
	 * 用户登录
	 * @param pageModel
	 * @return  object[0] 为登陆的user，object[1]为登陆记录
	 * @throws Exception
	 */
	Object[] usersLogin(PageUsers pageModel) throws Exception;
	/**
	 * 手机验证码登录  第一次就直接注册 初始密码为123456
	 * @param pageModel
	 * @return
	 * @throws Exception
	 */
	Object[] userLoginByPhone(PageUsers pageModel) throws Exception;
	/**
	 * 用户注册
	 * @param pageModel
	 * @throws Exception
	 */
	Users usersRegister(PageUsers pageModel) throws Exception; 
	/**
	 * 用户登录
	 * @throws Exception
	 */
	void usersLogout() throws Exception;
	/**
	 * 获取UserInfo
	 * @return User
	 * @throws Exception
	 */
	Users getUserInfo(String phone) throws Exception;
}
