package com.happyholiday.admin.users.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.users.pageModel.PageUsersUpload;
import com.happyholiday.admin.users.pageModel.PageUsersUploadHead;
import com.happyholiday.admin.users.service.UsersServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;

public class UsersUploadAction implements ModelDriven<PageUsersUpload>{
	PageUsersUpload pageModel = new PageUsersUpload();
	@Override
	public PageUsersUpload getModel() {
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
	public void usersUpload (){
		BackReturnJSON retJSON = new BackReturnJSON();
		
        try {
        	Admins onlineAdmin = BackTools.getOnlineAdmin();
			//执行业务
			usersService.usersUpload(onlineAdmin,pageModel);
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
