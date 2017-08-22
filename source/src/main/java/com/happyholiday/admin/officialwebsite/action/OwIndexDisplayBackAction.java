package com.happyholiday.admin.officialwebsite.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexDisplayBack;
import com.happyholiday.admin.officialwebsite.service.OwIndexDisplayBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owIndexDisplayBackAction")
public class OwIndexDisplayBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwIndexDisplayBack>{
	private OwIndexDisplayBackServiceI owIndexDisplayBackService;
	//注入owIndexDisplayBackService
	
	//注入pageModel
	private PageOwIndexDisplayBack pageModel = new PageOwIndexDisplayBack();
	public OwIndexDisplayBackServiceI getOwIndexDisplayBackService() {
		return owIndexDisplayBackService;
	}
	@Autowired
	public void setOwIndexDisplayBackService(
			OwIndexDisplayBackServiceI owIndexDisplayBackService) {
		this.owIndexDisplayBackService = owIndexDisplayBackService;
	}
	@Override
	public PageOwIndexDisplayBack getModel() {
		return pageModel;
	}

	/**
	 * 获取官网日常展示的图片信息列表
	 */
	public void getDatagrid(){
		OwBackReturnJSON<PageOwIndexDisplayBack> retJSON = new OwBackReturnJSON<PageOwIndexDisplayBack>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			retJSON = owIndexDisplayBackService.getDatagrid(onlineAdmin,pageModel);
		}catch (Exception e) {
			e.printStackTrace();
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
		}finally{
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 获取官网日常展示的图片
	 */
	public void getImgByImgName(){
		File imgFile = null;
		try {
			String imgName = pageModel.getImgName();
			//如果没有img，那么抛出异常
			if(OwBackTools.isEmptyTrimString(imgName)){
				throw new Exception("没有该图片！");
			}
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH,imgName);
			//如果没有img，那么抛出异常
			if(!imgFile.exists()){
				throw new Exception("没有该图片！");
			}
			
			
		} catch (Exception e) {
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH,"default.png");
			e.printStackTrace();
		}finally{
			super.writeImg(imgFile);
		}
	}
	/**
	 * 删除
	 */
	public void deleteIndexDisplays(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		OwBackReturnJSON<PageUsers> retJSON = new OwBackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			owIndexDisplayBackService.deleteIndexDisplays(onlineAdmin,pageModel);
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
