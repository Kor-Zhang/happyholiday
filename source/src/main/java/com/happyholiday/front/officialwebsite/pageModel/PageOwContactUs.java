package com.happyholiday.front.officialwebsite.pageModel;

import java.sql.Timestamp;

import com.happyholiday.model.Imgs;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageOwContactUs extends BaseReceivePage{
	private String id;
	private String email;
	private String personOrOrg;
	private String msg;
	private Timestamp updateTime;
	private Timestamp createTime;
	private Boolean isDelete;
	private Integer status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPersonOrOrg() {
		return personOrOrg;
	}
	public void setPersonOrOrg(String personOrOrg) {
		this.personOrOrg = personOrOrg;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
		
}