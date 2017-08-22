package com.happyholiday.admin.viewstickets.action;

import org.springframework.beans.factory.annotation.Autowired;









import com.happyholiday.admin.officialwebsite.util.OwBackTools;
import com.happyholiday.admin.viewstickets.pageModel.PageViewImgUpload;
import com.happyholiday.admin.viewstickets.service.ViewsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ViewImgUploadAction  extends ActionSupport implements ModelDriven<PageViewImgUpload>{
	private PageViewImgUpload pageModel = new PageViewImgUpload();
	@Override
	public PageViewImgUpload getModel() {
		// TODO 自动生成的方法存根
		return pageModel;
	}
	
	//配置service
	private ViewsServiceI viewsService;
	public ViewsServiceI getViewsService() {
		return viewsService;
	}
	@Autowired
	public void setViewsService(ViewsServiceI viewsService) {
		this.viewsService = viewsService;
	}
	
   public void addViewImg(){
		Admins onlineAdmin = OwBackTools.getOnlineAdmin();
	   ReturnJSON retJSON = new ReturnJSON();
	   try {
		   //执行事务
			viewsService.addViewImg(pageModel,onlineAdmin);
			retJSON.setMsg("上传成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			retJSON.setMsg("上传失败！");
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			Tools.writeJSON(retJSON);
		}
	   
   }
   
   
   
}
