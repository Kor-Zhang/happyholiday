package com.happyholiday.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Useradvices entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "useradvices", catalog = "happyholiday")
public class Useradvices implements java.io.Serializable {

	// Fields

	private String id;
	private String email;
	private String name;
	private String msg;

	// Constructors

	/** default constructor */
	public Useradvices() {
	}

	/** full constructor */
	public Useradvices(String id, String email, String name, String msg) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.msg = msg;
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

	@Column(name = "email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "msg", nullable = false)
	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}