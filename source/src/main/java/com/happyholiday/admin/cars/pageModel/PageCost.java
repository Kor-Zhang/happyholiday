package com.happyholiday.admin.cars.pageModel;

import java.sql.Timestamp;

import com.happyholiday.pagemodel.BaseReceivePage;


public class PageCost extends BaseReceivePage implements java.io.Serializable{
	
	private String id;
	private String name;
	private String introduction;
	private Double price;
	private String belong;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Boolean isDelete;
	
	/*************搜索条件**********************/
	private String searchName;
	private String searchIntroduction;
	private Double minPrice;
	private Double maxPrice;
	private Timestamp minCreateTime;
	private Timestamp maxCreateTime;
	private Timestamp minUpdateTime;
	private Timestamp maxUpdateTime;
	
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchIntroduction() {
		return searchIntroduction;
	}
	public void setSearchIntroduction(String searchIntroduction) {
		this.searchIntroduction = searchIntroduction;
	}
	public Double getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Double minPrice) {
		this.minPrice = minPrice;
	}
	public Double getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Double maxPrice) {
		this.maxPrice = maxPrice;
	}
	public Timestamp getMinCreateTime() {
		return minCreateTime;
	}
	public void setMinCreateTime(Timestamp minCreateTime) {
		this.minCreateTime = minCreateTime;
	}
	public Timestamp getMaxCreateTime() {
		return maxCreateTime;
	}
	public void setMaxCreateTime(Timestamp maxCreateTime) {
		this.maxCreateTime = maxCreateTime;
	}
	public Timestamp getMinUpdateTime() {
		return minUpdateTime;
	}
	public void setMinUpdateTime(Timestamp minUpdateTime) {
		this.minUpdateTime = minUpdateTime;
	}
	public Timestamp getMaxUpdateTime() {
		return maxUpdateTime;
	}
	public void setMaxUpdateTime(Timestamp maxUpdateTime) {
		this.maxUpdateTime = maxUpdateTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getBelong() {
		return belong;
	}
	public void setBelong(String belong) {
		this.belong = belong;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
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
