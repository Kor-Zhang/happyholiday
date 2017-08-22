package com.happyholiday.front.viewstickets.pageModel;

import java.io.Serializable;
import java.sql.Timestamp;

import com.happyholiday.admin.viewstickets.pageModel.BaseReceivePage;

public class PageRecommendView extends BaseReceivePage implements Serializable{
	private String id;
	private String viewId;
	private String introduction;
	private Timestamp createTime;
	private String viewName;
	private Integer viewPrice;
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
	public String getViewId() {
		return viewId;
	}
	public void setViewId(String viewId) {
		this.viewId = viewId;
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
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public Integer getViewPrice() {
		return viewPrice;
	}
	public void setViewPrice(Integer viewPrice) {
		this.viewPrice = viewPrice;
	}
	
}
