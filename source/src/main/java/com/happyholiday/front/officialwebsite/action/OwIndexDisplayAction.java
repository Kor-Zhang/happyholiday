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
import com.happyholiday.front.officialwebsite.service.OwIndexCarouselServiceI;
import com.happyholiday.front.officialwebsite.service.OwIndexDisplayServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owIndexDisplayAction")
public class OwIndexDisplayAction extends OfficialWebsiteBaseAction  implements ModelDriven<PageOwIndexDisplay>{
	private OwIndexDisplayServiceI owIndexDisplayService;
	//注入owIndexDisplayService
	
	//注入pageModel
	private PageOwIndexDisplay pageModel = new PageOwIndexDisplay();
	public OwIndexDisplayServiceI getOwIndexDisplayService() {
		return owIndexDisplayService;
	}
	@Autowired
	public void setOwIndexDisplayService(
			OwIndexDisplayServiceI owIndexDisplayService) {
		this.owIndexDisplayService = owIndexDisplayService;
	}
	@Override
	public PageOwIndexDisplay getModel() {
		return pageModel;
	}
	/**
	 * 获取轮播信息
	 */
	public void getDisplays(){
		OwFrontReturnJSON<PageOwIndexDisplay> retJSON = new OwFrontReturnJSON<PageOwIndexDisplay>();
		try {
			//执行事务
			List<PageOwIndexDisplay> rows = owIndexDisplayService.getDisplays(pageModel);
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
	
	
	public void getImgByImgName(){
		File imgFile = new File(OwFrontStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH, pageModel.getImgName());
		if(!imgFile.exists()||OwFrontTools.isEmptyTrimString(pageModel.getImgName())){
			imgFile = new File(OwFrontStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_IMG_PATH, OwFrontStatic.OFFICIALWEBSITE_IDNEX_DISPLAY_DEFAULT_IMG_NAME);
		}
		super.writeImg(imgFile);
	}
	
}
