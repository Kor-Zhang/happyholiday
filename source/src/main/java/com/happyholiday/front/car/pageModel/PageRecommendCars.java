package com.happyholiday.front.car.pageModel;

import java.sql.Timestamp;

public class PageRecommendCars {
	//自带属性
	private String id;
	private Timestamp createTime;
	private String introduction;
	private String carId;
	//汽车属性

	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	private Integer price ;
	private String carBd;
	private String MainImgName;
	
	
	
	
	
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getCarBd() {
		return carBd;
	}
	public void setCarBd(String carBd) {
		this.carBd = carBd;
	}
	public String getMainImgName() {
		return MainImgName;
	}
	public void setMainImgName(String mainImgName) {
		MainImgName = mainImgName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	
	
	
}
