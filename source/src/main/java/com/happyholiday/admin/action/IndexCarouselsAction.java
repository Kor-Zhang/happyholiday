package com.happyholiday.admin.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.standard.Severity;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.compass.core.support.search.CompassSearchResults.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.pageModel.PageAdmins;
import com.happyholiday.admin.pageModel.PageIndexCarousels;
import com.happyholiday.admin.service.AdminLoginRecordServiceI;
import com.happyholiday.admin.service.AdminUpdateRecordServiceI;
import com.happyholiday.admin.service.AdminsServiceI;
import com.happyholiday.admin.service.IndexCarouselsServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.util.SessionMap;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "indexCarouselsAction")
public class IndexCarouselsAction extends AdminsBaseAction implements ModelDriven<PageIndexCarousels> {
	PageIndexCarousels pageModel = new PageIndexCarousels();
	@Override
	public PageIndexCarousels getModel() {
		return pageModel;
	}
	//注入indexCarouselsService
	private IndexCarouselsServiceI indexCarouselsService;
	
	public IndexCarouselsServiceI getIndexCarouselsService() {
		return indexCarouselsService;
	}
	@Autowired
	public void setIndexCarouselsService(
			IndexCarouselsServiceI indexCarouselsService) {
		this.indexCarouselsService = indexCarouselsService;
	}

	/**
	 * 获取权限管理的datagrid数据
	 * @author Jhon
	 */
	public void getCarouselsDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageIndexCarousels> retJSON = new BackReturnJSON<PageIndexCarousels>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = indexCarouselsService.getCarouselsDatagrid(onlineAdmin,pageModel);
			retJSON.setMsg("读取信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}
	public void getCarouselByImgName(){
		String imgName = pageModel.getImgName();
		
		//图片资源目录
		String imgPath = BackStatic.INDEX_CAROUSEL_IMG_PATH;
		//请求的图片资源
		String imgDir = imgPath+File.separator+imgName;
		File imgFile = new File(imgDir);
		if(!imgFile.exists()){
			imgDir = imgPath+File.separator+"default.png";
			imgFile = new File(imgDir);
		}
		writeImg(imgFile);
	}
	/**
	 * 删除carousel的img
	 */
	public void deleteIndexCarouselImgs(){
		/**
		 * 1.获取当前的admin，用户验证权限
		 * 2.查询信息
		 * 3.返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务

			indexCarouselsService.deleteCarouselsService(onlineAdmin,pageModel);
			//设置结果
			retJSON.setMsg("删除成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//3.返回结果
		super.writeJSON(retJSON);
	}
	
}
