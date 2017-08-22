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
 * ViewticketRecommendviews entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "viewticket_recommendviews", catalog = "happyholiday")
public class ViewticketRecommendviews implements java.io.Serializable {

	// Fields

	private String id;
	private ViewticketViews viewticketViews;
	private String introduction;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public ViewticketRecommendviews() {
	}

	/** minimal constructor */
	public ViewticketRecommendviews(String id, ViewticketViews viewticketViews,
			Timestamp createTime) {
		this.id = id;
		this.viewticketViews = viewticketViews;
		this.createTime = createTime;
	}

	/** full constructor */
	public ViewticketRecommendviews(String id, ViewticketViews viewticketViews,
			String introduction, Timestamp createTime) {
		this.id = id;
		this.viewticketViews = viewticketViews;
		this.introduction = introduction;
		this.createTime = createTime;
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
	@JoinColumn(name = "viewId", nullable = false)
	public ViewticketViews getViewticketViews() {
		return this.viewticketViews;
	}

	public void setViewticketViews(ViewticketViews viewticketViews) {
		this.viewticketViews = viewticketViews;
	}

	@Column(name = "introduction")
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "createTime", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}