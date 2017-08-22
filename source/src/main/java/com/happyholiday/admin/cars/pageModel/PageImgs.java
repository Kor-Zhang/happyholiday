package com.happyholiday.admin.cars.pageModel;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.happyholiday.model.Carimgs;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageImgs  extends BaseReceivePage implements Serializable{
	private String id; 
	private String imgName;
	private Boolean main;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Boolean getMain() {
		return main;
	}
	public void setMain(Boolean main) {
		this.main = main;
	}
	
	
}
