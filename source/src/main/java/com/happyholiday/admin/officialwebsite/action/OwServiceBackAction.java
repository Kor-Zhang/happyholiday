package com.happyholiday.admin.officialwebsite.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwServiceBack;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwServiceBack;
import com.happyholiday.admin.officialwebsite.service.OwServiceBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owServiceBackAction")
public class OwServiceBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwServiceBack>{
	//注入owServiceBackService
	private OwServiceBackServiceI owServiceBackService;
	
	@Autowired
	public OwServiceBackServiceI getOwServiceBackService() {
		return owServiceBackService;
	}
	public void setOwServiceBackService(OwServiceBackServiceI owServiceBackService) {
		this.owServiceBackService = owServiceBackService;
	}
	//注入pageModel
	private PageOwServiceBack pageModel = new PageOwServiceBack();
	
	@Override
	public PageOwServiceBack getModel() {
		return pageModel;
	}
	/**
	 * 获取业务信息列表
	 */
	public void getDatagrid(){
		OwBackReturnJSON<PageOwServiceBack> retJSON = new OwBackReturnJSON<PageOwServiceBack>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			retJSON = owServiceBackService.getDatagrid(onlineAdmin,pageModel);
			retJSON.setSuccess(true);
			retJSON.setMsg("读取信息成功！");
		}catch (Exception e) {
			e.printStackTrace();
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
		}finally{
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 获取业务的图片
	 */
	public void getServiceTextImgByImgName(){
		File imgFile = null;
		try {
			String imgName = pageModel.getImgName();
			//如果没有img，那么抛出异常
			if(OwBackTools.isEmptyTrimString(imgName)){
				throw new Exception("没有该图片！");
			}
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_SERVICE_IMG_PATH,imgName);
			//如果没有img，那么抛出异常
			if(!imgFile.exists()){
				throw new Exception("没有该图片！");
			}
			
			
		} catch (Exception e) {
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_SERVICE_IMG_PATH,"default.png");
			e.printStackTrace();
		}finally{
			super.writeImg(imgFile);
		}
	}
	/**
	 * 上传业务的文本信息
	 */
	public void uploadTextService(){
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	owServiceBackService.uploadTextService(onlineAdmin,pageModel);
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
	 * 更新业务的文本信息
	 */
	public void updateTextService(){
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	owServiceBackService.updateTextService(onlineAdmin,pageModel);
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
	public void deleteService(){
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
			owServiceBackService.deleteService(onlineAdmin,pageModel);
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
