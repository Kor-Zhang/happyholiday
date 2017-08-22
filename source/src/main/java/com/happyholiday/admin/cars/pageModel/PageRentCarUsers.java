package com.happyholiday.admin.cars.pageModel;

import com.happyholiday.pagemodel.BaseReceivePage;

public class PageRentCarUsers extends BaseReceivePage {

	
	
	private String id;
	private String realName;
	private String email;
	private String cardClazz;
	private String cardNumber;
	private String phone;
	private Boolean isDelete;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
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
	
}
