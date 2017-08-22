package com.happyholiday.admin.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.SystemddlException;
import com.happyholiday.admin.pageModel.PageSystemddl;
import com.happyholiday.admin.service.SystemddlServiceI;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.model.Admins;
import com.opensymphony.xwork2.ModelDriven;


/**
 * 在struts2.xml中配置
 * 添加car
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "systemddlAction")

public class SystemddlAction extends AdminsBaseAction implements ModelDriven<PageSystemddl> {
	
	private PageSystemddl pageModel = new PageSystemddl();

	@Override
	public PageSystemddl getModel() {
		return pageModel;
	}
	private SystemddlServiceI systemddlService;

	
	public SystemddlServiceI getSystemddlService() {
		return systemddlService;
	}

	@Autowired
	public void setSystemddlService(SystemddlServiceI systemddlService) {
		this.systemddlService = systemddlService;
	}


	/**
	 * 获取字典的根节点
	 *//*
	public void getSystemddlRootDatagrid(){
		*//**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 *//*
		ReturnJSON<PageSystemddl> retJSON = new ReturnJSON<PageSystemddl>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = Tools.getOnlineAdmin();
			//2.执行事务
			retJSON = systemddlService.getSystemddlRootDatagrid(onlineAdmin,pageModel);
			retJSON.setMsg("读取信息成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			
			//返回结果
			super.writeJSON(retJSON);
		}
	}*/
	

	/**
	 * 通过传来的父节点id，获取当前节点的子节点
	 */
	public void getSystemddlByParentId(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageSystemddl> retJSON = new BackReturnJSON<PageSystemddl>();
		try {
			List<PageSystemddl> systemddls = null;
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			systemddls = systemddlService.getSystemddlByParentId(onlineAdmin,pageModel.getId());
			retJSON.setRows(systemddls);
			retJSON.setMsg("");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 通过传来的父节点id，添加一个新节点
	 */
	public void addSystemddl(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON<PageSystemddl> retJSON = new BackReturnJSON<PageSystemddl>();
		try {
			PageSystemddl systemddl = new PageSystemddl();
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			systemddl = systemddlService.addSystemddl(onlineAdmin,pageModel.getId());
			retJSON.setObj(systemddl);
			retJSON.setSuccess(true);
			retJSON.setMsg("添加成功！");
		} catch (AdminsException e) {
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
			e.printStackTrace();
		
		} catch (SystemddlException e) {
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setSuccess(false);
			retJSON.setMsg(e.getMessage());
			e.printStackTrace();
		}finally{
			
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	
	/**
	 * 通过传来的id，和text修改节点信息
	 */
	public void updateSystemddl(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			systemddlService.updateSystemddl(onlineAdmin,pageModel);
			retJSON.setMsg("更新成功！");
			retJSON.setSuccess(true);
		} catch (AdminsException e) {
			e.printStackTrace();
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
		} catch (SystemddlException e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}catch (Exception e) {
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			
			//返回结果
			super.writeJSON(retJSON);
		}
	}
	/**
	 * 通过传来的id删除节点
	 */
	public void deleteSystemddl(){
		/**
		 * 获取当前在线admin
		 * 执行事务
		 * 返回结果
		 */
		BackReturnJSON retJSON = new BackReturnJSON<>();
		try {
			//1.获取当前在线admin
			Admins onlineAdmin = BackTools.getOnlineAdmin();
			//2.执行事务
			systemddlService.deleteSystemddl(onlineAdmin,pageModel);

			retJSON.setMsg("删除成功！");
			retJSON.setSuccess(true);
		} catch (Exception e) {
			
			e.printStackTrace();
			retJSON.setMsg(e.getMessage());
			retJSON.setSuccess(false);
		
		} finally{
			
			//返回结果
			super.writeJSON(retJSON);
		}
	}
}
