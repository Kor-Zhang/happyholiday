package com.happyholiday.model;

import java.sql.Timestamp;
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
 * ViewticketViews entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "viewticket_views", catalog = "happyholiday")
public class ViewticketViews implements java.io.Serializable {

	// Fields

	private String id;
	private String country;
	private String province;
	private String city;
	private String name;
	private String grade;
	private String address;
	private String feature;
	private String opentime;
	private Boolean isDelete;
	private Timestamp creatTime;
	private String type;
	private Boolean hasIntro;
	private Integer salesNumber;
	private Set<ViewticketTickets> viewticketTicketses = new HashSet<ViewticketTickets>(
			0);
	private Set<ViewticketRecommendviews> viewticketRecommendviewses = new HashSet<ViewticketRecommendviews>(
			0);
	private Set<ViewticketViewsIntroductions> viewticketViewsIntroductionses = new HashSet<ViewticketViewsIntroductions>(
			0);
	private Set<ViewticketViewsImgs> viewticketViewsImgses = new HashSet<ViewticketViewsImgs>(
			0);

	// Constructors

	/** default constructor */
	public ViewticketViews() {
	}

	/** minimal constructor */
	public ViewticketViews(String id, String country, String province,
			String city, String name, String address, String opentime,
			Boolean isDelete, Timestamp creatTime, String type, Boolean hasIntro) {
		this.id = id;
		this.country = country;
		this.province = province;
		this.city = city;
		this.name = name;
		this.address = address;
		this.opentime = opentime;
		this.isDelete = isDelete;
		this.creatTime = creatTime;
		this.type = type;
		this.hasIntro = hasIntro;
	}

	/** full constructor */
	public ViewticketViews(String id, String country, String province,
			String city, String name, String grade, String address,
			String feature, String opentime, Boolean isDelete,
			Timestamp creatTime, String type, Boolean hasIntro,
			Integer salesNumber, Set<ViewticketTickets> viewticketTicketses,
			Set<ViewticketRecommendviews> viewticketRecommendviewses,
			Set<ViewticketViewsIntroductions> viewticketViewsIntroductionses,
			Set<ViewticketViewsImgs> viewticketViewsImgses) {
		this.id = id;
		this.country = country;
		this.province = province;
		this.city = city;
		this.name = name;
		this.grade = grade;
		this.address = address;
		this.feature = feature;
		this.opentime = opentime;
		this.isDelete = isDelete;
		this.creatTime = creatTime;
		this.type = type;
		this.hasIntro = hasIntro;
		this.salesNumber = salesNumber;
		this.viewticketTicketses = viewticketTicketses;
		this.viewticketRecommendviewses = viewticketRecommendviewses;
		this.viewticketViewsIntroductionses = viewticketViewsIntroductionses;
		this.viewticketViewsImgses = viewticketViewsImgses;
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

	@Column(name = "country", nullable = false, length = 10)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "province", nullable = false, length = 10)
	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@Column(name = "city", nullable = false, length = 10)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "name", nullable = false, length = 36)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "grade", length = 36)
	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Column(name = "address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "feature")
	public String getFeature() {
		return this.feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	@Column(name = "opentime", nullable = false)
	public String getOpentime() {
		return this.opentime;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Column(name = "creatTime", nullable = false, length = 19)
	public Timestamp getCreatTime() {
		return this.creatTime;
	}

	public void setCreatTime(Timestamp creatTime) {
		this.creatTime = creatTime;
	}

	@Column(name = "type", nullable = false)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "hasIntro", nullable = false)
	public Boolean getHasIntro() {
		return this.hasIntro;
	}

	public void setHasIntro(Boolean hasIntro) {
		this.hasIntro = hasIntro;
	}

	@Column(name = "salesNumber")
	public Integer getSalesNumber() {
		return this.salesNumber;
	}

	public void setSalesNumber(Integer salesNumber) {
		this.salesNumber = salesNumber;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "viewticketViews")
	public Set<ViewticketTickets> getViewticketTicketses() {
		return this.viewticketTicketses;
	}

	public void setViewticketTicketses(
			Set<ViewticketTickets> viewticketTicketses) {
		this.viewticketTicketses = viewticketTicketses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "viewticketViews")
	public Set<ViewticketRecommendviews> getViewticketRecommendviewses() {
		return this.viewticketRecommendviewses;
	}

	public void setViewticketRecommendviewses(
			Set<ViewticketRecommendviews> viewticketRecommendviewses) {
		this.viewticketRecommendviewses = viewticketRecommendviewses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "viewticketViews")
	public Set<ViewticketViewsIntroductions> getViewticketViewsIntroductionses() {
		return this.viewticketViewsIntroductionses;
	}

	public void setViewticketViewsIntroductionses(
			Set<ViewticketViewsIntroductions> viewticketViewsIntroductionses) {
		this.viewticketViewsIntroductionses = viewticketViewsIntroductionses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "viewticketViews")
	public Set<ViewticketViewsImgs> getViewticketViewsImgses() {
		return this.viewticketViewsImgses;
	}

	public void setViewticketViewsImgses(
			Set<ViewticketViewsImgs> viewticketViewsImgses) {
		this.viewticketViewsImgses = viewticketViewsImgses;
	}

}