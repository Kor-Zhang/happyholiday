package com.happyholiday.admin.viewstickets.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageViewCarouselUpload;
import com.happyholiday.admin.viewstickets.service.ViewCarouselsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;
/**
 * struts2.xml 中配置
 * @author 熊铖
 *
 */
public class ViewCarouselUploadAction extends AdminsBaseAction implements  ModelDriven<PageViewCarouselUpload>{
	private PageViewCarouselUpload pageModel = new PageViewCarouselUpload();
	@Override
	public PageViewCarouselUpload getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	//配置service
	private  ViewCarouselsServiceI viewCarouselservice;
	public ViewCarouselsServiceI getViewCarouselservice() {
		return viewCarouselservice;
	}
	@Autowired
	public void setViewCarouselservice(ViewCarouselsServiceI viewCarouselservice) {
		this.viewCarouselservice = viewCarouselservice;
	}
	
	public void addCarousel(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
		ReturnJSON retJSON = new ReturnJSON();
		try {
			viewCarouselservice.addCarouselImg(pageModel,onlineAdmin);
			retJSON.setMsg("上传成功");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}	
	
	}
	

}
