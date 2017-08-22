package com.happyholiday.admin.officialwebsite.pageModel;

import java.io.File;
import java.sql.Timestamp;

import com.happyholiday.model.Imgs;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageOwNewsBack extends BaseReceivePage{
	private String id;
	private String title;
	private String text;
	private Timestamp updateTime;
	private Timestamp createTime;
	private Boolean isDelete;
	private Integer status;
	private File imgFile;
	private String imgFileContentType;
	private String imgName;
	
	
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public File getImgFile() {
		return imgFile;
	}
	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}
	public String getImgFileContentType() {
		return imgFileContentType;
	}
	public void setImgFileContentType(String imgFileContentType) {
		this.imgFileContentType = imgFileContentType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "PageOwNewsBack [id=" + id + ", title=" + title + ", text="
				+ text + ", updateTime=" + updateTime + ", createTime="
				+ createTime + ", isDelete=" + isDelete + ", status=" + status
				+ ", imgFile=" + imgFile + ", imgFileContentType="
				+ imgFileContentType + ", imgName=" + imgName + "]";
	}
	
}