package com.happyholiday.admin.users.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCarUpload;
import com.happyholiday.admin.users.pageModel.PageUsersUploadHead;
import com.happyholiday.admin.users.service.UsersServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UsersUploadHeadAction extends ActionSupport implements ModelDriven<PageUsersUploadHead>{
	PageUsersUploadHead pageModel = new PageUsersUploadHead();
	@Override
	public PageUsersUploadHead getModel() {
		return pageModel;
	}
	private UsersServiceI usersService;
	public UsersServiceI getUsersService() {
		return usersService;
	}
	@Autowired
	public void setUsersService(UsersServiceI usersService) {
		this.usersService = usersService;
	}
	public void uploadHead (){
		BackReturnJSON retJSON = new BackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
			usersService.updateHead(onlineAdmin,pageModel);
			retJSON.setMsg("上传成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg("上传失败！");
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			BackTools.writeJSON(retJSON);
			
		}
	}
	
}
