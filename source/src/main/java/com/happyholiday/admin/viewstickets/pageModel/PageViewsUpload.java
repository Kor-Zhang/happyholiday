package com.happyholiday.admin.viewstickets.pageModel;

import java.io.File;
import java.sql.Timestamp;

public class PageViewsUpload {
	// 用来封装上传的文件  
    private File[] uploadFile;  
    //用来封装上传文件的类型  
    private String[] uploadFileContentType; 
    private Integer page = 0;
	private Integer rows = 0;
	private String sort = "id";
	private String order = "desc";
	private String searchId = "";
	private String deleteIds = "";
	private String deleteCarImgIds = "";
	private String imgName; 
    private Integer mainNumber = 0;	
	
	//基础属性
	private String id;
	private String country;
	private String province;
	private String city;
	private String name;
	private String grade;
	private String address;
	private String feature;
	private String opentime;
	private String endtime;
	private Boolean isDelete;
	private Timestamp creatTime;
	private String type;
	public File[] getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(File[] uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getUploadFileContentType() {
		return uploadFileContentType;
	}
	public void setUploadFileContentType(String[] uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getDeleteIds() {
		return deleteIds;
	}
	public void setDeleteIds(String deleteIds) {
		this.deleteIds = deleteIds;
	}
	public String getDeleteCarImgIds() {
		return deleteCarImgIds;
	}
	public void setDeleteCarImgIds(String deleteCarImgIds) {
		this.deleteCarImgIds = deleteCarImgIds;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Integer getMainNumber() {
		return mainNumber;
	}
	public void setMainNumber(Integer mainNumber) {
		this.mainNumber = mainNumber;
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
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
