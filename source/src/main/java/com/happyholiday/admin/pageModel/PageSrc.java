package com.happyholiday.admin.pageModel;

import java.util.Date;

import com.happyholiday.pagemodel.BaseReceivePage;

public class PageSrc extends BaseReceivePage {
	private String imgName;
	private Long currtTime;
	
	
	public Long getCurrtTime() {
		return currtTime;
	}

	public void setCurrtTime(Long currtTime) {
		this.currtTime = currtTime;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
}	
