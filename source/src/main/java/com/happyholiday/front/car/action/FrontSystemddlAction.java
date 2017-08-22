package com.happyholiday.front.car.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.CarsBaseAction;
import com.happyholiday.front.car.pageModel.PageSystemddl;
import com.happyholiday.front.car.service.FrontSystemddlServiceI;
import com.happyholiday.front.car.util.Tools;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 在struts2.xml中配置
 * 添加car
 * @author Jhon
 * 
 */
@Namespace("/")
@Action(value = "frontSystemddlAction")

public class FrontSystemddlAction extends	CarsBaseAction implements ModelDriven<PageSystemddl> {
	
	private PageSystemddl pageModel = new PageSystemddl();

	@Override
	public PageSystemddl getModel() {
		return pageModel;
	}
	private FrontSystemddlServiceI frontSystemddlService;
	public FrontSystemddlServiceI getFrontSystemddlService() {
		return frontSystemddlService;
	}



	@Autowired
	public void setFrontSystemddlService(
			FrontSystemddlServiceI frontSystemddlService) {
		this.frontSystemddlService = frontSystemddlService;
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
		List<PageSystemddl> systemddls = Tools.getArrayList();
		try {
			//2.执行事务
			systemddls = frontSystemddlService.getSystemddlByParentId(pageModel.getId());
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			
			//返回结果
			super.writeJSON(systemddls);
		}
	}




	
}
