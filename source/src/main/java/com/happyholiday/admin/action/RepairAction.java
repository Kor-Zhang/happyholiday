package com.happyholiday.admin.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.dao.AdminsDaoI;
import com.happyholiday.admin.service.MenuTreeServiceI;
import com.happyholiday.admin.service.RepairServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.opensymphony.xwork2.ModelDriven;
@Namespace("/")
@Action(value="repairAction")
public class RepairAction extends AdminsBaseAction{
	private RepairServiceI repairService;

	public RepairServiceI getRepairService() {
		return repairService;
	}
	@Autowired
	public void setRepairService(RepairServiceI repairService) {
		this.repairService = repairService;
	}
	
	
	/**
	 * 修复
	 */
	public void repairAll(){
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			repairService.repairAll();
			retJSON.setMsg("修复all成功！");
		} catch (Exception e) {
			retJSON.setMsg("修复all失败！"+e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
		
	}
	/**
	 * 修复TREE
	 */
	public void repairMenuTree(){
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			repairService.repairMenuTree();
			retJSON.setMsg("修复MenuTree成功！");
		} catch (Exception e) {
			retJSON.setMsg("修复MenuTree失败！"+e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
		
	}
	/**
	 * 修复users
	 */
	public void repairUsers(){
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			repairService.repairUsers();
			retJSON.setMsg("修复users成功！");
		} catch (Exception e) {
			retJSON.setMsg("修复users失败！"+e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
		
	}
	/**
	 * 修复orders
	 */
	public void repairOrders(){
		BackReturnJSON retJSON = new BackReturnJSON();
		try {
			repairService.repairOrders();
			retJSON.setMsg("修复orders成功！");
		} catch (Exception e) {
			retJSON.setMsg("修复orders失败！"+e.getMessage());
			retJSON.setSuccess(false);
			e.printStackTrace();
		}finally{
			super.writeJSON(retJSON);
		}
		
	}
	
}
