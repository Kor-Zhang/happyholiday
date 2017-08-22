package com.happyholiday.admin.users.pageModel;

import java.sql.Timestamp;

import com.happyholiday.model.Users;


public class PageUserLoginRecord implements java.io.Serializable {
	private Integer page = 0;
	private Integer rows = 0;
	private String sort = "id";
	private String order = "desc";
	private String searchId = "";
	
	private String loginRecordId;
	private String userId;
	private String userPhone;
	private Timestamp loginTime;
	private Timestamp logoffTime;
	private String loginAddress;
	private String loginIp;
	private Boolean isDelete;
	
	
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getLoginRecordId() {
		return loginRecordId;
	}
	public void setLoginRecordId(String loginRecordId) {
		this.loginRecordId = loginRecordId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}
	public Timestamp getLogoffTime() {
		return logoffTime;
	}
	public void setLogoffTime(Timestamp logoffTime) {
		this.logoffTime = logoffTime;
	}
	public String getLoginAddress() {
		return loginAddress;
	}
	public void setLoginAddress(String loginAddress) {
		this.loginAddress = loginAddress;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
