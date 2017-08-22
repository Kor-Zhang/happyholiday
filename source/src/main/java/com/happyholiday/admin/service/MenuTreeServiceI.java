package com.happyholiday.admin.service;

import java.util.List;

import com.happyholiday.admin.pageModel.PageMenuTree;

public interface MenuTreeServiceI {

	List<PageMenuTree> getTree(String id);
	
}
