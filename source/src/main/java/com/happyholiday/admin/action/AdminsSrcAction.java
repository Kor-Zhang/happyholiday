package com.happyholiday.admin.action;

import java.io.File;
import java.util.Date;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.action.BaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.pageModel.PageSrc;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "adminsSrcAction")
public class AdminsSrcAction extends BaseAction implements ModelDriven<PageSrc> {
	PageSrc pageModel = new PageSrc();
	@Override
	public PageSrc getModel() {
		return pageModel;
	}

	
	/**
	 * 获取背景图片资源，需要的是imgName
	 */
	public void getBgImgSrc(){
		String bgPath = BackStatic.BG_ADMIN_PATH;
		
		writeImg(new File(bgPath,pageModel.getImgName()));
	}

	/**
	 * 获取图标图片资源，需要的是imgName
	 */
	public void getIconImgSrc(){
		String bgPath = BackStatic.ICON_ADMIN_PATH;
		
		writeImg(new File(bgPath,pageModel.getImgName()));
	}
	/**
	 * 获取当前时间
	 */
	public void getCurrtTime(){
		Date currtTime = new Date();
		PageSrc returnModel = new PageSrc();
		returnModel.setCurrtTime(currtTime.getTime());
		writeJSON(returnModel);
	}
	
}
