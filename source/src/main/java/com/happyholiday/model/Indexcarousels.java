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
 * Indexcarousels entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "indexcarousels", catalog = "happyholiday")
public class Indexcarousels implements java.io.Serializable {

	// Fields

	private String id;
	private Imgs imgs;
	private Timestamp createTime;
	private String introduction;

	// Constructors

	/** default constructor */
	public Indexcarousels() {
	}

	/** full constructor */
	public Indexcarousels(String id, Imgs imgs, Timestamp createTime,
			String introduction) {
		this.id = id;
		this.imgs = imgs;
		this.createTime = createTime;
		this.introduction = introduction;
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

}