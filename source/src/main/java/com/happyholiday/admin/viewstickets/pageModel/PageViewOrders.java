package com.happyholiday.admin.viewstickets.pageModel;

import java.sql.Timestamp;

public class PageViewOrders extends BaseReceivePage {
	private String id;
	private String ticketId;
	private String userId;
	private Timestamp travelTime;
	private Integer price;
	private Integer totalPrice;
	private Integer number;
	private String getTicketName;
	private String getTicketPhone;
	private Boolean isDelete;
	private Timestamp createTime;
	private Integer status;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTicketId() {
		return ticketId;
	}
	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getTravelTime() {
		return travelTime;
	}
	public void setTravelTime(Timestamp travelTime) {
		this.travelTime = travelTime;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getGetTicketName() {
		return getTicketName;
	}
	public void setGetTicketName(String getTicketName) {
		this.getTicketName = getTicketName;
	}
	public String getGetTicketPhone() {
		return getTicketPhone;
	}
	public void setGetTicketPhone(String getTicketPhone) {
		this.getTicketPhone = getTicketPhone;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}
