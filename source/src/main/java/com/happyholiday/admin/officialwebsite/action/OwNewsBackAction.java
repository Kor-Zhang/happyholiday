package com.happyholiday.admin.officialwebsite.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.client.HttpServerErrorException;

import com.alibaba.fastjson.JSONObject;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwNewsBack;
import com.happyholiday.admin.officialwebsite.service.OwNewsBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owNewsBackAction")
public class OwNewsBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwNewsBack>{
	//注入owNewsBackService
	private OwNewsBackServiceI owNewsBackService;
	
	public OwNewsBackServiceI getOwNewsBackService() {
		return owNewsBackService;
	}
	@Autowired
	public void setOwNewsBackService(OwNewsBackServiceI owNewsBackService) {
		this.owNewsBackService = owNewsBackService;
	}


	//注入pageModel
	private PageOwNewsBack pageModel = new PageOwNewsBack();
	
	@Override
	public PageOwNewsBack getModel() {
		return pageModel;
	}
	/**
	 * 获取新闻信息列表
	 */
	public void getDatagrid(){
		OwBackReturnJSON<PageOwNewsBack> retJSON = new OwBackReturnJSON<PageOwNewsBack>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			retJSON = owNewsBackService.getDatagrid(onlineAdmin,pageModel);
			retJSON.setSuccess(true);
			retJSON.setMsg("读取信息成功！");
		}catch (Exception e) {
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 获取新闻的图片
	 */
	public void getNewsTextImgByImgName(){
		File imgFile = null;
		try {
			String imgName = pageModel.getImgName();
			//如果没有img，那么抛出异常
			if(OwBackTools.isEmptyTrimString(imgName)){
				throw new Exception("没有该图片！");
			}
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_NEWS_IMG_PATH,imgName);
			//如果没有img，那么抛出异常
			if(!imgFile.exists()){
				throw new Exception("没有该图片！");
			}
			
			
		} catch (Exception e) {
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_NEWS_IMG_PATH,"default.png");
			e.printStackTrace();
		}finally{
			super.writeImg(imgFile);
		}
	}
	/**
	 * 上传新闻的文本信息
	 */
	public void uploadTextNews(){
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	owNewsBackService.uploadTextNews(onlineAdmin,pageModel);
			retJSON.setMsg("添加成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			OwBackTools.writeJSON(retJSON);
			
		}
		
		
	}
	/**
	 * 更新新闻的文本信息
	 */
	public void updateTextNews(){
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	owNewsBackService.updateTextNews(onlineAdmin,pageModel);
			retJSON.setMsg("更新成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			OwBackTools.writeJSON(retJSON);
			
		}
		
		
	}
	public void deleteNews(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			owNewsBackService.deleteNews(onlineAdmin,pageModel);
			retJSON.setMsg("删除信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
}
