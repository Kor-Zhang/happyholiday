package com.happyholiday.admin.cars.pageModel;

import java.io.File;
import java.sql.Timestamp;

import com.happyholiday.model.Cost;
import com.happyholiday.model.Orders;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageRentCarCost extends BaseReceivePage{

	private String id;
	private String costId;
	private String orderId;
	private Integer number;
	private Double price;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Boolean isDelete;
	
	
	private String costIntroduction;
	private String costName;
	
	
	
	public String getCostIntroduction() {
		return costIntroduction;
	}
	public void setCostIntroduction(String costIntroduction) {
		this.costIntroduction = costIntroduction;
	}
	public String getCostName() {
		return costName;
	}
	public void setCostName(String costName) {
		this.costName = costName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCostId() {
		return costId;
	}
	public void setCostId(String costId) {
		this.costId = costId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
}
