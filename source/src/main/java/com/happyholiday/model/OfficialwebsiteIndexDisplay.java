package com.happyholiday.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OfficialwebsiteIndexDisplay entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "officialwebsite_index_display", catalog = "happyholiday")
public class OfficialwebsiteIndexDisplay implements java.io.Serializable {

	// Fields

	private String id;
	private String imgName;
	private String introduction;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Integer status;
	private Boolean isDelete;

	// Constructors

	/** default constructor */
	public OfficialwebsiteIndexDisplay() {
	}

	/** minimal constructor */
	public OfficialwebsiteIndexDisplay(String id, String imgName,
			Timestamp createTime, Timestamp updateTime, Integer status,
			Boolean isDelete) {
		this.id = id;
		this.imgName = imgName;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.status = status;
		this.isDelete = isDelete;
	}

	/** full constructor */
	public OfficialwebsiteIndexDisplay(String id, String imgName,
			String introduction, Timestamp createTime, Timestamp updateTime,
			Integer status, Boolean isDelete) {
		this.id = id;
		this.imgName = imgName;
		this.introduction = introduction;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.status = status;
		this.isDelete = isDelete;
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

	@Column(name = "imgName", nullable = false, length = 55)
	public String getImgName() {
		return this.imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@Column(name = "introduction")
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "createTime", nullable = false, length = 0)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "updateTime", nullable = false, length = 0)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

}