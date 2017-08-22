package com.happyholiday.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Imgs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "imgs", catalog = "happyholiday")
public class Imgs implements java.io.Serializable {

	// Fields

	private String id;
	private String imgName;
	private Set<ViewticketCarousels> viewticketCarouselses = new HashSet<ViewticketCarousels>(
			0);
	private Set<ViewticketViewsImgs> viewticketViewsImgses = new HashSet<ViewticketViewsImgs>(
			0);
	private Set<Carimgs> carimgses = new HashSet<Carimgs>(0);
	private Set<Users> userses = new HashSet<Users>(0);
	private Set<OfficialwebsiteIndexImg> officialwebsiteIndexImgs = new HashSet<OfficialwebsiteIndexImg>(
			0);
	private Set<Indexcarousels> indexcarouselses = new HashSet<Indexcarousels>(
			0);

	// Constructors

	/** default constructor */
	public Imgs() {
	}

	/** minimal constructor */
	public Imgs(String id, String imgName) {
		this.id = id;
		this.imgName = imgName;
	}

	/** full constructor */
	public Imgs(String id, String imgName,
			Set<ViewticketCarousels> viewticketCarouselses,
			Set<ViewticketViewsImgs> viewticketViewsImgses,
			Set<Carimgs> carimgses, Set<Users> userses,
			Set<OfficialwebsiteIndexImg> officialwebsiteIndexImgs,
			Set<Indexcarousels> indexcarouselses) {
		this.id = id;
		this.imgName = imgName;
		this.viewticketCarouselses = viewticketCarouselses;
		this.viewticketViewsImgses = viewticketViewsImgses;
		this.carimgses = carimgses;
		this.userses = userses;
		this.officialwebsiteIndexImgs = officialwebsiteIndexImgs;
		this.indexcarouselses = indexcarouselses;
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

	@Column(name = "imgName", nullable = false)
	public String getImgName() {
		return this.imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "imgs")
	public Set<ViewticketCarousels> getViewticketCarouselses() {
		return this.viewticketCarouselses;
	}

	public void setViewticketCarouselses(
			Set<ViewticketCarousels> viewticketCarouselses) {
		this.viewticketCarouselses = viewticketCarouselses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "imgs")
	public Set<ViewticketViewsImgs> getViewticketViewsImgses() {
		return this.viewticketViewsImgses;
	}

	public void setViewticketViewsImgses(
			Set<ViewticketViewsImgs> viewticketViewsImgses) {
		this.viewticketViewsImgses = viewticketViewsImgses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "imgs")
	public Set<Carimgs> getCarimgses() {
		return this.carimgses;
	}

	public void setCarimgses(Set<Carimgs> carimgses) {
		this.carimgses = carimgses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "imgs")
	public Set<Users> getUserses() {
		return this.userses;
	}

	public void setUserses(Set<Users> userses) {
		this.userses = userses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "imgs")
	public Set<OfficialwebsiteIndexImg> getOfficialwebsiteIndexImgs() {
		return this.officialwebsiteIndexImgs;
	}

	public void setOfficialwebsiteIndexImgs(
			Set<OfficialwebsiteIndexImg> officialwebsiteIndexImgs) {
		this.officialwebsiteIndexImgs = officialwebsiteIndexImgs;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "imgs")
	public Set<Indexcarousels> getIndexcarouselses() {
		return this.indexcarouselses;
	}

	public void setIndexcarouselses(Set<Indexcarousels> indexcarouselses) {
		this.indexcarouselses = indexcarouselses;
	}

}