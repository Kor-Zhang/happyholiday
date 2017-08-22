package com.happyholiday.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ViewticketViewsImgs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "viewticket_views_imgs", catalog = "happyholiday")
public class ViewticketViewsImgs implements java.io.Serializable {

	// Fields

	private String id;
	private ViewticketViews viewticketViews;
	private Imgs imgs;
	private Boolean main;

	// Constructors

	/** default constructor */
	public ViewticketViewsImgs() {
	}

	/** full constructor */
	public ViewticketViewsImgs(String id, ViewticketViews viewticketViews,
			Imgs imgs, Boolean main) {
		this.id = id;
		this.viewticketViews = viewticketViews;
		this.imgs = imgs;
		this.main = main;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "imgId", nullable = false)
	public Imgs getImgs() {
		return this.imgs;
	}

	public void setImgs(Imgs imgs) {
		this.imgs = imgs;
	}

	@Column(name = "main", nullable = false)
	public Boolean getMain() {
		return this.main;
	}

	public void setMain(Boolean main) {
		this.main = main;
	}

}