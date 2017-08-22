package com.happyholiday.admin.cars.pageModel;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import com.happyholiday.model.Cars;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageRecommendCars extends BaseReceivePage implements Serializable{
	private String id;
	private String carId;
	private String introduction;
	private Timestamp createTime;
	private String imgName;
	
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
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
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	
}
