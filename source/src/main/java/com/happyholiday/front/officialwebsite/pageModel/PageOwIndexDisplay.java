package com.happyholiday.front.officialwebsite.pageModel;

import java.sql.Timestamp;

import com.happyholiday.model.Imgs;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageOwIndexDisplay extends BaseReceivePage{
	
	
	private String id;
	private String introduction;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Integer status;
	private Boolean isDelete;
	
	
	/**************添加字段**************/
	private String imgName;
	
	
	
	
	
	
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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
