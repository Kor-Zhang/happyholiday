package com.happyholiday.front.officialwebsite.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.OfficialWebsiteBaseAction;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwNews;
import com.happyholiday.front.officialwebsite.service.OwNewsServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontReturnJSON;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.opensymphony.xwork2.ModelDriven;
@Action(value="owNewsAction")
public class OwNewsAction extends OfficialWebsiteBaseAction  implements ModelDriven<PageOwNews>{
	//注入owNewsService
	private OwNewsServiceI owNewsService;
	
	public OwNewsServiceI getOwNewsService() {
		return owNewsService;
	}
	@Autowired
	public void setOwNewsService(OwNewsServiceI owNewsService) {
		this.owNewsService = owNewsService;
	}


	//注入pageModel
	private PageOwNews pageModel = new PageOwNews();
	
	@Override
	public PageOwNews getModel() {
		return pageModel;
	}
	/**
	 * 获取分页新闻
	 */
	public void getNews(){
		OwFrontReturnJSON<PageOwNews> retJSON = new OwFrontReturnJSON<PageOwNews>();
		try {
			//执行事务
			retJSON = owNewsService.getNews(pageModel);
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
