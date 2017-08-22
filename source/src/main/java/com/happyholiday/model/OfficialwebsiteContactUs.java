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
 * OfficialwebsiteContactUs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "officialwebsite_contact_us", catalog = "happyholiday")
public class OfficialwebsiteContactUs implements java.io.Serializable {

	// Fields

	private String id;
	private Admins admins;
	private String email;
	private String personOrOrg;
	private String msg;
	private Timestamp updateTime;
	private Timestamp createTime;
	private Boolean isDelete;
	private Integer status;
	private String adminNote;

	// Constructors

	/** default constructor */
	public OfficialwebsiteContactUs() {
	}

	/** minimal constructor */
	public OfficialwebsiteContactUs(String id, String email,
			String personOrOrg, String msg, Timestamp updateTime,
			Timestamp createTime, Boolean isDelete, Integer status) {
		this.id = id;
		this.email = email;
		this.personOrOrg = personOrOrg;
		this.msg = msg;
		this.updateTime = updateTime;
		this.createTime = createTime;
		this.isDelete = isDelete;
		this.status = status;
	}

	/** full constructor */
	public OfficialwebsiteContactUs(String id, Admins admins, String email,
			String personOrOrg, String msg, Timestamp updateTime,
			Timestamp createTime, Boolean isDelete, Integer status,
			String adminNote) {
		this.id = id;
		this.admins = admins;
		this.email = email;
		this.personOrOrg = personOrOrg;
		this.msg = msg;
		this.updateTime = updateTime;
		this.createTime = createTime;
		this.isDelete = isDelete;
		this.status = status;
		this.adminNote = adminNote;
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
	@JoinColumn(name = "dealAdminId")
	public Admins getAdmins() {
		return this.admins;
	}

	public void setAdmins(Admins admins) {
		this.admins = admins;
	}

	@Column(name = "email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "personOrOrg", nullable = false)
	public String getPersonOrOrg() {
		return this.personOrOrg;
	}

	public void setPersonOrOrg(String personOrOrg) {
		this.personOrOrg = personOrOrg;
	}

	@Column(name = "msg", nullable = false, length = 65535)
	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Column(name = "updateTime", nullable = false, length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "createTime", nullable = false, length = 19)
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

	@Column(name = "adminNote", length = 65535)
	public String getAdminNote() {
		return this.adminNote;
	}

	public void setAdminNote(String adminNote) {
		this.adminNote = adminNote;
	}

}