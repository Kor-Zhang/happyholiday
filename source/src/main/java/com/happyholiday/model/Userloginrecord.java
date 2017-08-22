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
 * Userloginrecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "userloginrecord", catalog = "happyholiday")
public class Userloginrecord implements java.io.Serializable {

	// Fields

	private String loginRecordId;
	private Users users;
	private Timestamp loginTime;
	private Timestamp logoffTime;
	private String loginAddress;
	private String loginIp;
	private Boolean isDelete;

	// Constructors

	/** default constructor */
	public Userloginrecord() {
	}

	/** full constructor */
	public Userloginrecord(String loginRecordId, Users users,
			Timestamp loginTime, Timestamp logoffTime, String loginAddress,
			String loginIp, Boolean isDelete) {
		this.loginRecordId = loginRecordId;
		this.users = users;
		this.loginTime = loginTime;
		this.logoffTime = logoffTime;
		this.loginAddress = loginAddress;
		this.loginIp = loginIp;
		this.isDelete = isDelete;
	}

	// Property accessors
	@Id
	@Column(name = "loginRecordId", unique = true, nullable = false, length = 36)
	public String getLoginRecordId() {
		return this.loginRecordId;
	}

	public void setLoginRecordId(String loginRecordId) {
		this.loginRecordId = loginRecordId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "loginTime", nullable = false, length = 19)
	public Timestamp getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	@Column(name = "logoffTime", nullable = false, length = 19)
	public Timestamp getLogoffTime() {
		return this.logoffTime;
	}

	public void setLogoffTime(Timestamp logoffTime) {
		this.logoffTime = logoffTime;
	}

	@Column(name = "loginAddress", nullable = false)
	public String getLoginAddress() {
		return this.loginAddress;
	}

	public void setLoginAddress(String loginAddress) {
		this.loginAddress = loginAddress;
	}

	@Column(name = "loginIP", nullable = false)
	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

}