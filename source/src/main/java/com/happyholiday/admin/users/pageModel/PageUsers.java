package com.happyholiday.admin.users.pageModel;

import com.happyholiday.pagemodel.BaseReceivePage;

public class PageUsers  extends BaseReceivePage{

	
	
	private String id;
	private String phone;
	private String userName;
	private String realName;
	private String password;
	private Integer status;
	private String email;
	private String cardClazz;
	private String cardNumber;
	private Boolean isDelete;
	private String head;
	private Integer role;
	private String guideVerifyImgId;
	//搜索条件
	private Integer searchStatus;
	private String searchCardNumber;
	private String searchPhone;
	private String searchEmail;
	private String searchUserName;	
	private String searchRealName;
	private String searchCardClazz;
	private Integer eqRole;
	
	
	
	
	
	public String getGuideVerifyImgId() {
		return guideVerifyImgId;
	}
	public void setGuideVerifyImgId(String guideVerifyImgId) {
		this.guideVerifyImgId = guideVerifyImgId;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	
	public Integer getEqRole() {
		return eqRole;
	}
	public void setEqRole(Integer eqRole) {
		this.eqRole = eqRole;
	}
	public String getSearchCardNumber() {
		return searchCardNumber;
	}
	public void setSearchCardNumber(String searchCardNumber) {
		this.searchCardNumber = searchCardNumber;
	}
	public String getSearchPhone() {
		return searchPhone;
	}
	public void setSearchPhone(String searchPhone) {
		this.searchPhone = searchPhone;
	}
	
	public String getSearchUserName() {
		return searchUserName;
	}
	public void setSearchUserName(String searchUserName) {
		this.searchUserName = searchUserName;
	}
	
	
	public String getSearchEmail() {
		return searchEmail;
	}
	public void setSearchEmail(String searchEmail) {
		this.searchEmail = searchEmail;
	}
	public String getSearchRealName() {
		return searchRealName;
	}
	public void setSearchRealName(String searchRealName) {
		this.searchRealName = searchRealName;
	}
	
	public Integer getSearchStatus() {
		return searchStatus;
	}
	public void setSearchStatus(Integer searchStatus) {
		this.searchStatus = searchStatus;
	}
	public String getSearchCardClazz() {
		return searchCardClazz;
	}
	public void setSearchCardClazz(String searchCardClazz) {
		this.searchCardClazz = searchCardClazz;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCardClazz() {
		return cardClazz;
	}
	public void setCardClazz(String cardClazz) {
		this.cardClazz = cardClazz;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	
}
