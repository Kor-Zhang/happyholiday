package com.happyholiday.admin.viewstickets.pageModel;

import java.sql.Timestamp;

public class PageViewTickets  extends BaseReceivePage{
	private String id;
	private String viewId;
	private String viewName;
	private String name;
	private String type;
	private String style;
	private String orderTime;
	private Integer marketPrice;
	private Integer happyPrice;
	private String payType;
	private Boolean isDelete;
	private Timestamp creatTime;
	
	//查询属性
	private String searchName;
	private String searchType;
	private String searchStyle;
	private Integer minMarketPrice;
	private Integer maxMarketPrice;
	private Integer minHappyPrice;
	private Integer maxHappyPrice;
	private String searchPayType;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getViewId() {
		return viewId;
	}
	public void setViewId(String viewId) {
		this.viewId = viewId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	
	public Integer getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(Integer marketPrice) {
		this.marketPrice = marketPrice;
	}
	public Integer getHappyPrice() {
		return happyPrice;
	}
	public void setHappyPrice(Integer happyPrice) {
		this.happyPrice = happyPrice;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public Timestamp getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Timestamp creatTime) {
		this.creatTime = creatTime;
	}
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchStyle() {
		return searchStyle;
	}
	public void setSearchStyle(String searchStyle) {
		this.searchStyle = searchStyle;
	}

	public String getSearchPayType() {
		return searchPayType;
	}
	public void setSearchPayType(String searchPayType) {
		this.searchPayType = searchPayType;
	}
	public Integer getMinMarketPrice() {
		return minMarketPrice;
	}
	public void setMinMarketPrice(Integer minMarketPrice) {
		this.minMarketPrice = minMarketPrice;
	}
	public Integer getMaxMarketPrice() {
		return maxMarketPrice;
	}
	public void setMaxMarketPrice(Integer maxMarketPrice) {
		this.maxMarketPrice = maxMarketPrice;
	}
	public Integer getMinHappyPrice() {
		return minHappyPrice;
	}
	public void setMinHappyPrice(Integer minHappyPrice) {
		this.minHappyPrice = minHappyPrice;
	}
	public Integer getMaxHappyPrice() {
		return maxHappyPrice;
	}
	public void setMaxHappyPrice(Integer maxHappyPrice) {
		this.maxHappyPrice = maxHappyPrice;
	}
	
	
}
