package com.happyholiday.admin.officialwebsite.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.officialwebsite.OwBackStatic;
import com.happyholiday.admin.officialwebsite.exception.OfficialwebsiteBackException;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwMembersBack;
import com.happyholiday.admin.officialwebsite.pageModel.PageOwMembersBack;
import com.happyholiday.admin.officialwebsite.service.OwMembersBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owMembersBackAction")
public class OwMembersBacksAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwMembersBack>{
	//注入owMembersBackService
	private OwMembersBackServiceI owMembersBackService;
	
	
	public OwMembersBackServiceI getOwMembersBackService() {
		return owMembersBackService;
	}
	@Autowired
	public void setOwMembersBackService(OwMembersBackServiceI owMembersBackService) {
		this.owMembersBackService = owMembersBackService;
	}


	//注入pageModel
	private PageOwMembersBack pageModel = new PageOwMembersBack();
	
	@Override
	public PageOwMembersBack getModel() {
		return pageModel;
	}
	
	
	/**
	 * 获取官网日常展示的图片信息列表
	 */
	public void getDatagrid(){
		OwBackReturnJSON<PageOwMembersBack> retJSON = new OwBackReturnJSON<PageOwMembersBack>();
		try {
			Admins onlineAdmin = OwBackTools.getOnlineAdmin();
			retJSON = owMembersBackService.getDatagrid(onlineAdmin,pageModel);
		} catch (OfficialwebsiteBackException e) {
			e.printStackTrace();
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 获取官网日常展示的图片
	 */
	public void getImgByHead(){
		File imgFile = null;
		try {
			String head = pageModel.getHead();
			//如果没有img，那么抛出异常
			if(OwBackTools.isEmptyTrimString(head)){
				throw new Exception("没有该图片！");
			}
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH,head);
			//如果没有img，那么抛出异常
			if(!imgFile.exists()){
				throw new Exception("没有该图片！");
			}
			
			
		} catch (Exception e) {
			imgFile = new File(OwBackStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH,"default.png");
			e.printStackTrace();
		}finally{
			super.writeImg(imgFile);
		}
	}
	/**
	 * 删除
	 */
	public void deleteMembers(){
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
			owMembersBackService.deleteMembers(onlineAdmin,pageModel);
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
