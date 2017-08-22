package com.happyholiday.front.car.pageModel;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;


public class PageSystemddl implements Serializable{
	
	
	private String state;
	private Map<String,Object> attrbutes;
	// Fields

	private String id;
	private String parentId;
	private String iconCls;
	private String text;
	private String url;
	
	public Map<String, Object> getAttrbutes() {
		return attrbutes;
	}
	public void setAttrbutes(Map<String, Object> attrbutes) {
		this.attrbutes = attrbutes;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
