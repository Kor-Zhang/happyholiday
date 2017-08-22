package com.happyholiday.admin.officialwebsite.action;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexDisplayBack;
import com.happyholiday.admin.officialwebsite.service.OwIndexDisplayBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owIndexDisplayUploadBackAction")
public class OwIndexDisplayUploadBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwIndexDisplayBack>{
	private OwIndexDisplayBackServiceI owIndexDisplayBackService;
	//注入owIndexDisplayBackService
	public OwIndexDisplayBackServiceI getOwIndexDisplayBackService() {
		return owIndexDisplayBackService;
	}
	@Autowired
	public void setOwIndexDisplayBackService(
			OwIndexDisplayBackServiceI owIndexDisplayBackService) {
		this.owIndexDisplayBackService = owIndexDisplayBackService;
	}
	//注入pageModel
	private PageOwIndexDisplayBack pageModel = new PageOwIndexDisplayBack();
	@Override
	public PageOwIndexDisplayBack getModel() {
		return pageModel;
	}

	/**
	 * 上传首页日常展示
	 */
	public void uploadIndexDisplay(){
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	owIndexDisplayBackService.uploadIndexDisplay(onlineAdmin,pageModel);
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
	
}
