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
 * ViewticketViewsIntroductions entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "viewticket_views_introductions", catalog = "happyholiday")
public class ViewticketViewsIntroductions implements java.io.Serializable {

	// Fields

	private String id;
	private ViewticketViews viewticketViews;
	private String textDescription;
	private String textDescriptionTwo;
	private String textDescriptionThree;
	private String introduction;
	private String introductionTwo;
	private String introductionThree;
	private Boolean isDelete;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public ViewticketViewsIntroductions() {
	}

	/** minimal constructor */
	public ViewticketViewsIntroductions(String id,
			ViewticketViews viewticketViews, String textDescription,
			String introduction, Boolean isDelete, Timestamp createTime) {
		this.id = id;
		this.viewticketViews = viewticketViews;
		this.textDescription = textDescription;
		this.introduction = introduction;
		this.isDelete = isDelete;
		this.createTime = createTime;
	}

	/** full constructor */
	public ViewticketViewsIntroductions(String id,
			ViewticketViews viewticketViews, String textDescription,
			String textDescriptionTwo, String textDescriptionThree,
			String introduction, String introductionTwo,
			String introductionThree, Boolean isDelete, Timestamp createTime) {
		this.id = id;
		this.viewticketViews = viewticketViews;
		this.textDescription = textDescription;
		this.textDescriptionTwo = textDescriptionTwo;
		this.textDescriptionThree = textDescriptionThree;
		this.introduction = introduction;
		this.introductionTwo = introductionTwo;
		this.introductionThree = introductionThree;
		this.isDelete = isDelete;
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

	@Column(name = "textDescription", nullable = false, length = 65535)
	public String getTextDescription() {
		return this.textDescription;
	}

	public void setTextDescription(String textDescription) {
		this.textDescription = textDescription;
	}

	@Column(name = "textDescriptionTwo", length = 65535)
	public String getTextDescriptionTwo() {
		return this.textDescriptionTwo;
	}

	public void setTextDescriptionTwo(String textDescriptionTwo) {
		this.textDescriptionTwo = textDescriptionTwo;
	}

	@Column(name = "textDescriptionThree", length = 65535)
	public String getTextDescriptionThree() {
		return this.textDescriptionThree;
	}

	public void setTextDescriptionThree(String textDescriptionThree) {
		this.textDescriptionThree = textDescriptionThree;
	}

	@Column(name = "introduction", nullable = false, length = 65535)
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "introductionTwo", length = 65535)
	public String getIntroductionTwo() {
		return this.introductionTwo;
	}

	public void setIntroductionTwo(String introductionTwo) {
		this.introductionTwo = introductionTwo;
	}

	@Column(name = "introductionThree", length = 65535)
	public String getIntroductionThree() {
		return this.introductionThree;
	}

	public void setIntroductionThree(String introductionThree) {
		this.introductionThree = introductionThree;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Column(name = "createTime", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}