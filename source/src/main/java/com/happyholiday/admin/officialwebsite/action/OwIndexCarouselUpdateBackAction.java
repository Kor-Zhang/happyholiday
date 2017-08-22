package com.happyholiday.admin.officialwebsite.action;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.officialwebsite.pageModel.PageOwIndexCarouselBack;
import com.happyholiday.admin.officialwebsite.service.OwIndexCarouselBackServiceI;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owIndexCarouselUpdateBackAction")
public class OwIndexCarouselUpdateBackAction extends OfficialwebsiteBackBaseAction  implements ModelDriven<PageOwIndexCarouselBack>{
	private OwIndexCarouselBackServiceI owIndexCarouselBackService;
	//注入owIndexCarouselBackService
	public OwIndexCarouselBackServiceI getOwIndexCarouselBackService() {
		return owIndexCarouselBackService;
	}
	@Autowired
	public void setOwIndexCarouselBackService(
			OwIndexCarouselBackServiceI owIndexCarouselBackService) {
		this.owIndexCarouselBackService = owIndexCarouselBackService;
	}
	//注入pageModel
	private PageOwIndexCarouselBack pageModel = new PageOwIndexCarouselBack();
	@Override
	public PageOwIndexCarouselBack getModel() {
		return pageModel;
	}

	/**
	 * 更新轮播
	 */
	public void updateIndexCarsoul(){
		OwBackReturnJSON retJSON = new OwBackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	owIndexCarouselBackService.updateIndexCarsoul(onlineAdmin,pageModel);
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
