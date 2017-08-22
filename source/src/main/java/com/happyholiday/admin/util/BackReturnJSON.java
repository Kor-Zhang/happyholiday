package com.happyholiday.admin.util;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.happyholiday.util.PubReturnJSON;

public class BackReturnJSON<T> extends PubReturnJSON<T>{
	private Integer error;

	public Integer getError() {
		return error;
	}

	public void setError(Integer error) {
		this.error = error;
	}
	
}
