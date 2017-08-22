package com.happyholiday.front.viewstickets.pageModel;

import java.sql.Timestamp;

public class PageViewOrder {
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
	
	//其他需要显示的属性
	private String viewName;
	private String viewGrade;
	private String viewAddress;
	private String imgName;   //主要图片
	
	//个人中心 查询订单的状态
	private Timestamp startTime;
	private Timestamp endTime;
	private String type;
	//分页属性
	private Integer rows;
	private Integer page;
	
	
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public String getViewGrade() {
		return viewGrade;
	}
	public void setViewGrade(String viewGrade) {
		this.viewGrade = viewGrade;
	}
	public String getViewAddress() {
		return viewAddress;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setViewAddress(String viewAddress) {
		this.viewAddress = viewAddress;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	 
}
