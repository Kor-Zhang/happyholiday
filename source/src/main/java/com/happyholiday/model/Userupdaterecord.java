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
 * Userupdaterecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "userupdaterecord", catalog = "happyholiday")
public class Userupdaterecord implements java.io.Serializable {

	// Fields

	private String updateRecordId;
	private Users users;
	private Admins admins;
	private String item;
	private Timestamp updateTime;
	private Boolean isDelete;

	// Constructors

	/** default constructor */
	public Userupdaterecord() {
	}

	/** minimal constructor */
	public Userupdaterecord(String updateRecordId, Users users, String item,
			Timestamp updateTime, Boolean isDelete) {
		this.updateRecordId = updateRecordId;
		this.users = users;
		this.item = item;
		this.updateTime = updateTime;
		this.isDelete = isDelete;
	}

	/** full constructor */
	public Userupdaterecord(String updateRecordId, Users users, Admins admins,
			String item, Timestamp updateTime, Boolean isDelete) {
		this.updateRecordId = updateRecordId;
		this.users = users;
		this.admins = admins;
		this.item = item;
		this.updateTime = updateTime;
		this.isDelete = isDelete;
	}

	// Property accessors
	@Id
	@Column(name = "updateRecordId", unique = true, nullable = false, length = 36)
	public String getUpdateRecordId() {
		return this.updateRecordId;
	}

	public void setUpdateRecordId(String updateRecordId) {
		this.updateRecordId = updateRecordId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "doneUserId", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "doAdminId")
	public Admins getAdmins() {
		return this.admins;
	}

	public void setAdmins(Admins admins) {
		this.admins = admins;
	}

	@Column(name = "item", nullable = false)
	public String getItem() {
		return this.item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Column(name = "updateTime", nullable = false, length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

}