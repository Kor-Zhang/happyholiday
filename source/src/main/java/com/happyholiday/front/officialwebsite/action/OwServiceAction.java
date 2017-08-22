package com.happyholiday.front.officialwebsite.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.OfficialWebsiteBaseAction;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwNews;
import com.happyholiday.front.officialwebsite.pageModel.PageOwService;
import com.happyholiday.front.officialwebsite.service.OwNewsServiceI;
import com.happyholiday.front.officialwebsite.service.OwServiceServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owServiceAction")
public class OwServiceAction extends OfficialWebsiteBaseAction  implements ModelDriven<PageOwService>{
	//注入owServiceService
	private OwServiceServiceI owServiceService;
	
	@Autowired
	public OwServiceServiceI getOwServiceService() {
		return owServiceService;
	}
	public void setOwServiceService(OwServiceServiceI owServiceService) {
		this.owServiceService = owServiceService;
	}
	//注入pageModel
	private PageOwService pageModel = new PageOwService();
	
	@Override
	public PageOwService getModel() {
		return pageModel;
	}
	/**
	 * 获取分页业务信息
	 */
	public void getService(){
		OwFrontReturnJSON<PageOwService> retJSON = new OwFrontReturnJSON<PageOwService>();
		try {
			//执行事务
			retJSON = owServiceService.getService(pageModel);
			retJSON.setMsg("读取信息成功！");
			retJSON.setSuccess(true);
		} catch (OfficialwebsiteException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{

			super.writeJSON(retJSON);
		}
		
	}
	
	
	
}
