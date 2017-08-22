package com.happyholiday.pagemodel;

import java.sql.Timestamp;

import com.happyholiday.model.Imgs;

public class PageIndex {
		//图片轮播属性
		private String id;
		private String carouselsImgName;
		private Timestamp createTime;
		private String introduction;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
	
		public String getCarouselsImgName() {
			return carouselsImgName;
		}
		public void setCarouselsImgName(String carouselsImgName) {
			this.carouselsImgName = carouselsImgName;
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
