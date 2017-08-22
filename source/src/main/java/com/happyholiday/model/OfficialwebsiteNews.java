package com.happyholiday.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OfficialwebsiteNews entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "officialwebsite_news", catalog = "happyholiday")
public class OfficialwebsiteNews implements java.io.Serializable {

	// Fields

	private String id;
	private String title;
	private String text;
	private Timestamp updateTime;
	private Timestamp createTime;
	private Boolean isDelete;
	private Integer status;

	// Constructors

	/** default constructor */
	public OfficialwebsiteNews() {
	}

	/** full constructor */
	public OfficialwebsiteNews(String id, String title, String text,
			Timestamp updateTime, Timestamp createTime, Boolean isDelete,
			Integer status) {
		this.id = id;
		this.title = title;
		this.text = text;
		this.updateTime = updateTime;
		this.createTime = createTime;
		this.isDelete = isDelete;
		this.status = status;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "title", nullable = false)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "text", nullable = false, length = 65535)
	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Column(name = "updateTime", nullable = false, length = 0)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "createTime", nullable = false, length = 0)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}