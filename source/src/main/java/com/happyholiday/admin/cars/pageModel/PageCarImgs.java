package com.happyholiday.admin.cars.pageModel;

import com.happyholiday.model.Cars;
import com.happyholiday.model.Imgs;

public class PageCarImgs {
	 private String id;
     private String carId;
     private String imgId;
     private Boolean main;
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
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	public Boolean getMain() {
		return main;
	}
	public void setMain(Boolean main) {
		this.main = main;
	}
     
}
