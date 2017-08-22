package com.happyholiday.front.officialwebsite.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.OfficialWebsiteBaseAction;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexCarousel;
import com.happyholiday.front.officialwebsite.pageModel.PageOwIndexDisplay;
import com.happyholiday.front.officialwebsite.pageModel.PageOwMembers;
import com.happyholiday.front.officialwebsite.service.OwIndexCarouselServiceI;
import com.happyholiday.front.officialwebsite.service.OwIndexDisplayServiceI;
import com.happyholiday.front.officialwebsite.service.OwMembersServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owMembersAction")
public class OwMembersAction extends OfficialWebsiteBaseAction  implements ModelDriven<PageOwMembers>{
	//注入owMembersService
	private OwMembersServiceI owMembersService;
	
	
	public OwMembersServiceI getOwMembersService() {
		return owMembersService;
	}
	@Autowired
	public void setOwMembersService(OwMembersServiceI owMembersService) {
		this.owMembersService = owMembersService;
	}


	//注入pageModel
	private PageOwMembers pageModel = new PageOwMembers();
	
	@Override
	public PageOwMembers getModel() {
		return pageModel;
	}
	/**
	 * 获取轮播信息
	 */
	public void getMembers(){
		OwFrontReturnJSON<PageOwMembers> retJSON = new OwFrontReturnJSON<PageOwMembers>();
		try {
			//执行事务
			List<PageOwMembers> rows = owMembersService.getMembers(pageModel);
			retJSON.setRows(rows);
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
	
	/**
	 * 获取头像
	 */
	public void getHead(){
		File imgFile = new File(OwFrontStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH, pageModel.getHead());
		if(!imgFile.exists()||OwFrontTools.isEmptyTrimString(pageModel.getHead())){
			imgFile = new File(OwFrontStatic.OFFICIALWEBSITE_MEMBERS_IMG_PATH, OwFrontStatic.OFFICIALWEBSITE_MEMBERS_DEFAULT_IMG_NAME);
		}
		super.writeImg(imgFile);
	}
	
}
