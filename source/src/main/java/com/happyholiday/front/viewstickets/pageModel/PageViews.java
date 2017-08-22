package com.happyholiday.front.viewstickets.pageModel;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;



public class PageViews implements Serializable {
	//基础属性
	private String imgName;   //主要图片
	private List<String> imgsName; //景区的轮播图片
	private Integer lowPrice;  //景区票价的最低价格
	
	private List<PageViewTickets> viewticket ; //景区所有门票信息
	private List<PageViewIntro>  viewIntro;  //景区介绍
	public List<PageViewIntro> getViewIntro() {
		return viewIntro;
	}
	public void setViewIntro(List<PageViewIntro> viewIntro) {
		this.viewIntro = viewIntro;
	}
	public List<PageViewTickets> getViewticket() {
		return viewticket;
	}
	public void setViewticket(List<PageViewTickets> viewticket) {
		this.viewticket = viewticket;
	}
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
	
	//最低市场价
	private Integer marketPrice;
	
	//分页属性  
	private Integer page = 1;
	private Integer rows = 10;
	
	//排序条件
	private String sort;
	//搜索条件
	private String keyword;
	
	

	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getSalesNumber() {
		return salesNumber;
	}
	public void setSalesNumber(Integer salesNumber) {
		this.salesNumber = salesNumber;
	}
	public Integer getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(Integer marketPrice) {
		this.marketPrice = marketPrice;
	}
	public Boolean getHasIntro() {
		return hasIntro;
	}
	public void setHasIntro(Boolean hasIntro) {
		this.hasIntro = hasIntro;
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
	public List<String> getImgsName() {
		return imgsName;
	}
	public void setImgsName(List<String> imgsName) {
		this.imgsName = imgsName;
	}
	public Integer getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(Integer lowPrice) {
		this.lowPrice = lowPrice;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	     
}
