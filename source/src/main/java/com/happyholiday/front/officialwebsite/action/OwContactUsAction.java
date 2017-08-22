package com.happyholiday.front.officialwebsite.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.OfficialWebsiteBaseAction;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwContactUs;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexCarousel;
import com.happyholiday.front.officialwebsite.service.OwContactUsServiceI;
import com.happyholiday.front.officialwebsite.service.OwIndexCarouselServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owContactUsAction")
public class OwContactUsAction extends OfficialWebsiteBaseAction  implements ModelDriven<PageOwContactUs>{
	private OwContactUsServiceI owContactUsService;
	//注入owContactUsService
	public OwContactUsServiceI getOwContactUsService() {
		return owContactUsService;
	}
	@Autowired
	public void setOwContactUsService(OwContactUsServiceI owContactUsService) {
		this.owContactUsService = owContactUsService;
	}
	
	//注入pageModel
	private PageOwContactUs pageModel = new PageOwContactUs();
	@Override
	public PageOwContactUs getModel() {
		return pageModel;
	}
	/**
	 * 保存用户反馈信息
	 */
	public void saveContactUsMsg(){
		OwFrontReturnJSON retJSON = new OwFrontReturnJSON();
		try {
			//执行事务
			owContactUsService.saveContactUsMsg(pageModel);
			retJSON.setMsg("提交成功，我们会尽快和您取得联系");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
		
	}
}
