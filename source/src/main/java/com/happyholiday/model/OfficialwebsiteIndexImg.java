package com.happyholiday.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * OfficialwebsiteIndexImg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "officialwebsite_index_img", catalog = "happyholiday")
public class OfficialwebsiteIndexImg implements java.io.Serializable {

	// Fields

	private String id;
	private Imgs imgs;
	private Timestamp createTime;
	private String introduction;
	private Boolean isDelete;
	private Integer status;
	private Timestamp updateTime;

	// Constructors

	/** default constructor */
	public OfficialwebsiteIndexImg() {
	}

	/** full constructor */
	public OfficialwebsiteIndexImg(String id, Imgs imgs, Timestamp createTime,
			String introduction, Boolean isDelete, Integer status,
			Timestamp updateTime) {
		this.id = id;
		this.imgs = imgs;
		this.createTime = createTime;
		this.introduction = introduction;
		this.isDelete = isDelete;
		this.status = status;
		this.updateTime = updateTime;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "imgId", nullable = false)
	public Imgs getImgs() {
		return this.imgs;
	}

	public void setImgs(Imgs imgs) {
		this.imgs = imgs;
	}

	@Column(name = "createTime", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "introduction", nullable = false)
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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

	@Column(name = "updateTime", nullable = false, length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

}