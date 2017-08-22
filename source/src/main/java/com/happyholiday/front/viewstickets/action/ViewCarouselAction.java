package com.happyholiday.front.viewstickets.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.ViewsTicketsBaseAction;
import com.happyholiday.front.viewstickets.Static;
import com.happyholiday.front.viewstickets.pageModel.PageViewCarousels;
import com.happyholiday.front.viewstickets.service.ViewCarouselsServiceI;
import com.happyholiday.front.viewstickets.util.ReturnJSON;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value = "frontViewCarouselAction", results={
		})
public class ViewCarouselAction extends ViewsTicketsBaseAction implements ModelDriven<PageViewCarousels> {
	private PageViewCarousels pageModel = new PageViewCarousels();
	@Override
	public PageViewCarousels getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	
	//配置service
	private  ViewCarouselsServiceI frontViewCarouselservice;
	public ViewCarouselsServiceI getFrontViewCarouselservice() {
		return frontViewCarouselservice;
	}
	@Autowired
	public void setFrontViewCarouselservice(
			ViewCarouselsServiceI frontViewCarouselservice) {
		this.frontViewCarouselservice = frontViewCarouselservice;
	}
	
	public void   getCarouselInfo() {
		ReturnJSON<PageViewCarousels> ret = new ReturnJSON<PageViewCarousels>();
		try {
			List<PageViewCarousels> list = frontViewCarouselservice.getCarouselsImg(pageModel);
			ret.setRows(list);
			ret.setSuccess(true);
			ret.setTotal(list.size());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ret.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(ret);
		}
	}
	
	public void getCarouselsImg(){
		String imgName = pageModel.getImgName();
		//图片资源目录
		String imgPath = Static.viewCarouselPath;
		String imgDir = imgPath+File.separator+imgName;
		File imgFile = new File(imgDir);
		if(!imgFile.exists()){
			imgDir = imgPath+File.separator+"default.png";
			imgFile = new File(imgDir);
		}
		writeImg(imgFile);
	}
}
