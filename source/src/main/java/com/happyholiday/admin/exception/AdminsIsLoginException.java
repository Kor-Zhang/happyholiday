package com.happyholiday.admin.exception;
/**
 * 用户重复登陆异常
 * @author Jhon
 *
 */
public class AdminsIsLoginException extends AdminsException{

	public AdminsIsLoginException() {
		super();
	}

	public AdminsIsLoginException(String message) {
		super(message);
	}
	
}
