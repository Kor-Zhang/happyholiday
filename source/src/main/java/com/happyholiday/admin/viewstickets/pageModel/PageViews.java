package com.happyholiday.admin.viewstickets.pageModel;

import java.sql.Timestamp;

public class PageViews extends BaseReceivePage {
	
	private String deleteViewImgId = "";
	

	//基础属性
	private String imgName; 
	private String id;
	private String country;
	private String province;
	private String city;
	private String name;
	private String grade;
	private String type;
	private String address;
	private String feature;
	private String opentime;
	private Boolean isDelete;
	private Timestamp creatTime;
	private Boolean hasIntro;
	private Integer salesNumber;
	
	public Integer getSalesNumber() {
		return salesNumber;
	}
	public void setSalesNumber(Integer salesNumber) {
		this.salesNumber = salesNumber;
	}
	public Boolean getHasIntro() {
		return hasIntro;
	}
	public void setHasIntro(Boolean hasIntro) {
		this.hasIntro = hasIntro;
	}
	//查询属性
	private String searchCountry;
	private String searchProvince;
	private String searchCity;
	private String searchName;
	private String searchGrade;
	private String searchType;
	private String searchAddress;
	
	public String getSearchCountry() {
		return searchCountry;
	}
	public void setSearchCountry(String searchCountry) {
		this.searchCountry = searchCountry;
	}
	public String getSearchProvince() {
		return searchProvince;
	}
	public void setSearchProvince(String searchProvince) {
		this.searchProvince = searchProvince;
	}
	public String getSearchCity() {
		return searchCity;
	}
	public void setSearchCity(String searchCity) {
		this.searchCity = searchCity;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchGrade() {
		return searchGrade;
	}
	public void setSearchGrade(String searchGrade) {
		this.searchGrade = searchGrade;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchAddress() {
		return searchAddress;
	}
	public void setSearchAddress(String searchAddress) {
		this.searchAddress = searchAddress;
	}
	public String getDeleteViewImgId() {
		return deleteViewImgId;
	}
	public void setDeleteViewImgId(String deleteViewImgId) {
		this.deleteViewImgId = deleteViewImgId;
	}
	
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public Timestamp getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Timestamp creatTime) {
		this.creatTime = creatTime;
	}
	     
	  
	     
	
	     
}
