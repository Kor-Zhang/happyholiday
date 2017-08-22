package com.happyholiday.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SystemddlBak entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "systemddl_bak", catalog = "happyholiday")
public class SystemddlBak implements java.io.Serializable {

	// Fields

	private Integer seqId;
	private String keyword;
	private Integer ddlCode;
	private String ddlName;

	// Constructors

	/** default constructor */
	public SystemddlBak() {
	}

	/** minimal constructor */
	public SystemddlBak(Integer seqId) {
		this.seqId = seqId;
	}

	/** full constructor */
	public SystemddlBak(Integer seqId, String keyword, Integer ddlCode,
			String ddlName) {
		this.seqId = seqId;
		this.keyword = keyword;
		this.ddlCode = ddlCode;
		this.ddlName = ddlName;
	}

	// Property accessors
	@Id
	@Column(name = "seqID", unique = true, nullable = false)
	public Integer getSeqId() {
		return this.seqId;
	}

	public void setSeqId(Integer seqId) {
		this.seqId = seqId;
	}

	@Column(name = "keyword", length = 20)
	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Column(name = "ddlCode")
	public Integer getDdlCode() {
		return this.ddlCode;
	}

	public void setDdlCode(Integer ddlCode) {
		this.ddlCode = ddlCode;
	}

	@Column(name = "ddlName", length = 50)
	public String getDdlName() {
		return this.ddlName;
	}

	public void setDdlName(String ddlName) {
		this.ddlName = ddlName;
	}

}