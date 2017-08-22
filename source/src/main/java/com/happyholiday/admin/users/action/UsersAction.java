package com.happyholiday.admin.users.action;

import java.io.File;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageImgs;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.users.service.UsersServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Imgs;
import com.happyholiday.model.Users;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 配置action
 * 
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "usersAction")

public class UsersAction extends AdminsBaseAction implements ModelDriven<PageUsers> {
	
	private PageUsers pageModel = new PageUsers();

	@Override
	public PageUsers getModel() {
		return pageModel;
	}
	

	//配置usersService
	private UsersServiceI usersService;
	
	public UsersServiceI getUsersService() {
		return usersService;
	}
	@Autowired
	public void setUsersService(UsersServiceI usersService) {
		this.usersService = usersService;
	}
	/**
	 * 获取用户管理的datagrid数据
	 * @author Jhon
	 */
	public void getUsersDatagrid(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUsers> retJSON = new BackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = usersService.getDatagrid(onlineAdmin,pageModel);
			retJSON.setMsg("读取信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			
			//返回结果
			super.writeJSON(retJSON);
		}
		
	}
	/**
	 * 获取指定id的用户
	 * @author Jhon
	 */
	public void getSingleUserDatagridById(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUsers> retJSON = new BackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			retJSON = usersService.getSingleUserDatagridById(onlineAdmin,pageModel);
			retJSON.setMsg("读取信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 通过imgname获取用户头像图片
	 */
	public void getUserHead(){
		String imgName = pageModel.getHead();
		//汽车图片资源目录
		String carsImgPath = BackStatic.USERS_HEAD_PATH;
		//请求的图片资源
		String imgPath = carsImgPath+File.separator+imgName;
		File imgFile = new File(imgPath);
		//如果不存在该头像，那么选择默认头像
		if(imgName.equals("")||!imgFile.exists()){
			imgPath = carsImgPath+File.separator+"default.png";
			imgFile = new File(imgPath);
			
		}
		
		writeImg(imgFile);
	}
	
	/**
	 * 更新user的信息（不跟新密码,头像）
	 */
	public void editUsers(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUsers> retJSON = new BackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			usersService.editUsers(onlineAdmin,pageModel);
			retJSON.setMsg("修改信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 更新user的信息（不跟新密码,头像）
	 */
	public void deleteUsers(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUsers> retJSON = new BackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			usersService.deleteUsers(onlineAdmin,pageModel);
			retJSON.setMsg("删除信息成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}
		//返回结果
		super.writeJSON(retJSON);
	}
	/**
	 * 修改指定id的user的密码
	 */
	public void editUsersPwd(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUsers> retJSON = new BackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			usersService.editUsersPwd(onlineAdmin,pageModel);
			retJSON.setMsg("修改密码成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 通过User的id获取导游资格照片
	 */
	public void getGuideImgByUserId(){
		File imgFile = null;
		try {
			String userId = pageModel.getId();
			Users dbUser = usersService.getUserById(userId);
			Imgs guideImg = dbUser.getImgs();
			//如果该user没有guideimg，那么抛出异常
			if(guideImg==null){
				throw new Exception("没有该用户的导游执照图片");
			}
			String imgName = guideImg.getImgName();
			imgFile = new File(BackStatic.USERS_GUIDE_IMG_PATH,imgName);
			//如果该user没有guideimg，那么抛出异常
			if(!imgFile.exists()){
				throw new Exception("没有该用户的导游执照图片");
			}
			
			
		} catch (Exception e) {
			imgFile = new File(BackStatic.USERS_GUIDE_IMG_PATH,"default.png");
			e.printStackTrace();
		}finally{
			super.writeImg(imgFile);
		}
		
	}
	/**
	 * 确认验证导游成功
	 */
	public void confirmGuideRole(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUsers> retJSON = new BackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//设置其为导游
			pageModel.setRole(BackStatic.USERS_ROLE_GUIDE);
			//2.执行事务
			usersService.editUserRole(onlineAdmin,pageModel);
			retJSON.setMsg("修改成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 拒绝导游申请
	 */
	public void refuseGuideRole(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageUsers> retJSON = new BackReturnJSON<PageUsers>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//设置其为被拒绝
			pageModel.setRole(BackStatic.USERS_ROLE_APPLY_GUIDE_REFUSE);
			//2.执行事务
			usersService.editUserRole(onlineAdmin,pageModel);
			retJSON.setMsg("修改成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			//返回结果
			super.writeJSON(retJSON);
		}
	}
}
