package com.happyholiday.admin.officialwebsite.pageModel;

import java.sql.Timestamp;

import com.happyholiday.model.Imgs;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageOwMembersBack extends BaseReceivePage{
	private String id;
	private String name;
	private String position;
	private String introduction;
	private String head;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Integer status;
	private Boolean isDelete;
	
	//搜索条件
	private Integer eqStatus;
	private String  searchName;
	private String  searchPosition;
	private String  searchIntroduction;
	
	private Timestamp minCreateTime;
	private Timestamp maxCreateTime;
	private Timestamp minUpdateTime;
	private Timestamp maxUpdateTime;
	
	
	
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
	public Integer getEqStatus() {
		return eqStatus;
	}
	public void setEqStatus(Integer eqStatus) {
		this.eqStatus = eqStatus;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchPosition() {
		return searchPosition;
	}
	public void setSearchPosition(String searchPosition) {
		this.searchPosition = searchPosition;
	}
	public String getSearchIntroduction() {
		return searchIntroduction;
	}
	public void setSearchIntroduction(String searchIntroduction) {
		this.searchIntroduction = searchIntroduction;
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
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
}
