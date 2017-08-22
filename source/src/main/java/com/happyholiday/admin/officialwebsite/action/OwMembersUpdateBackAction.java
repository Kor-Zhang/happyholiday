package com.happyholiday.admin.officialwebsite.action;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.officialwebsite.pageModel.PageOwMembersBack;
import com.happyholiday.admin.officialwebsite.service.OwMembersBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
public class OwMembersUpdateBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwMembersBack>{
	private OwMembersBackServiceI owMembersBackService;
	//注入owMembersBackService
	public OwMembersBackServiceI getOwMembersBackService() {
		return owMembersBackService;
	}
	@Autowired
	public void setOwMembersBackService(
			OwMembersBackServiceI owMembersBackService) {
		this.owMembersBackService = owMembersBackService;
	}
	//注入pageModel
	private PageOwMembersBack pageModel = new PageOwMembersBack();
	@Override
	public PageOwMembersBack getModel() {
		return pageModel;
	}

	/**
	 * 更新轮播
	 */
	public void updateMembers(){
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	owMembersBackService.updateMembers(onlineAdmin,pageModel);
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
	
}
