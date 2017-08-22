package com.happyholiday.admin.users.pageModel;

import java.sql.Timestamp;

import com.happyholiday.model.Admins;
import com.happyholiday.model.Users;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageUserUpdateRecord  extends BaseReceivePage implements java.io.Serializable {
	
	private String updateRecordId;
	private String userId;
	private String userPhone;
	private String adminId;
	private String item;
	private Timestamp updateTime;
	private Boolean isDelete;
	
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	public String getUpdateRecordId() {
		return updateRecordId;
	}
	public void setUpdateRecordId(String updateRecordId) {
		this.updateRecordId = updateRecordId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
}