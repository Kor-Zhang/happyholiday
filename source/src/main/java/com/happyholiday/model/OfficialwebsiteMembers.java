package com.happyholiday.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OfficialwebsiteMembers entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "officialwebsite_members", catalog = "happyholiday")
public class OfficialwebsiteMembers implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String position;
	private String introduction;
	private String head;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Integer status;
	private Boolean isDelete;

	// Constructors

	/** default constructor */
	public OfficialwebsiteMembers() {
	}

	/** minimal constructor */
	public OfficialwebsiteMembers(String id, String name, String head,
			Timestamp createTime, Timestamp updateTime, Integer status,
			Boolean isDelete) {
		this.id = id;
		this.name = name;
		this.head = head;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.status = status;
		this.isDelete = isDelete;
	}

	/** full constructor */
	public OfficialwebsiteMembers(String id, String name, String position,
			String introduction, String head, Timestamp createTime,
			Timestamp updateTime, Integer status, Boolean isDelete) {
		this.id = id;
		this.name = name;
		this.position = position;
		this.introduction = introduction;
		this.head = head;
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

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "position")
	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Column(name = "introduction")
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "head", nullable = false, length = 55)
	public String getHead() {
		return this.head;
	}

	public void setHead(String head) {
		this.head = head;
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