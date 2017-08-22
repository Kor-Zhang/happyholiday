package com.happyholiday.admin.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.pageModel.PageIndexCarouselsUpload;
import com.happyholiday.admin.service.IndexCarouselsServiceI;
import com.happyholiday.admin.users.pageModel.PageUsersUpload;
import com.happyholiday.admin.users.pageModel.PageUsersUploadHead;
import com.happyholiday.admin.users.service.UsersServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;

public class IndexCarouselsUploadAction implements ModelDriven<PageIndexCarouselsUpload>{
	PageIndexCarouselsUpload pageModel = new PageIndexCarouselsUpload();
	@Override
	public PageIndexCarouselsUpload getModel() {
		return pageModel;
	}
	//注入indexCarouselsService
	private IndexCarouselsServiceI indexCarouselsService;
	
	public IndexCarouselsServiceI getIndexCarouselsService() {
		return indexCarouselsService;
	}
	@Autowired
	public void setIndexCarouselsService(
			IndexCarouselsServiceI indexCarouselsService) {
		this.indexCarouselsService = indexCarouselsService;
	}
	public void carouselsUpload (){
		BackReturnJSON retJSON = new BackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
        	indexCarouselsService.carouselsUpload(onlineAdmin,pageModel);
			retJSON.setMsg("添加成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			BackTools.writeJSON(retJSON);
			
		}
	}
	
}
