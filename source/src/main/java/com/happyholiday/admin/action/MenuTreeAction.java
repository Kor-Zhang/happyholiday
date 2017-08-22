package com.happyholiday.admin.action;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scripting.support.StaticScriptSource;

import com.happyholiday.action.AdminsBaseAction;
import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.pageModel.PageMenuTree;
import com.happyholiday.admin.service.MenuTreeServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.opensymphony.xwork2.ModelDriven;

@Namespace("/")
@Action(value = "menuTreeAction")
public class MenuTreeAction extends AdminsBaseAction implements
		ModelDriven<PageMenuTree> {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MenuTreeAction.class);

	PageMenuTree pageMenuTree = new PageMenuTree();
	private MenuTreeServiceI menuTreeService;

	public PageMenuTree getPageMenuTree() {
		return pageMenuTree;
	}

	public void setPageMenuTree(PageMenuTree pageMenuTree) {
		this.pageMenuTree = pageMenuTree;
	}

	public MenuTreeServiceI getMenuTreeService() {
		return menuTreeService;
	}

	@Autowired
	public void setMenuTreeService(MenuTreeServiceI menuTreeService) {
		this.menuTreeService = menuTreeService;
	}

	@Override
	public PageMenuTree getModel() {
		return pageMenuTree;
	}

	public void getTree() {
		List<PageMenuTree> mTree = menuTreeService.getTree(pageMenuTree.getId());
		super.writeJSON(mTree);

	}

}
