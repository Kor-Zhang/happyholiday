package com.happyholiday.interceptor;

import org.slf4j.Logger;

import com.happyholiday.util.PubTools;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


public class EncodingInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		PubTools.getReq().setCharacterEncoding("utf-8");
		PubTools.getRes().setContentType("text/html;charset=UTF-8;");
		PubTools.getRes().setCharacterEncoding("utf-8");
		return ai.invoke();
	}
	

}
