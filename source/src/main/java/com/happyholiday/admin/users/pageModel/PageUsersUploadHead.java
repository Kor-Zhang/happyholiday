package com.happyholiday.admin.users.pageModel;

import java.io.File;
import java.io.Serializable;

public class PageUsersUploadHead implements Serializable{
	private File uploadFile;
	private String uploadFileContentType;
	private String id;
	public File getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUploadFileContentType() {
		return uploadFileContentType;
	}
	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
