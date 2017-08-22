package com.happyholiday.front.car.service;

import java.util.List;

import com.happyholiday.front.car.pageModel.PageSystemddl;
import com.happyholiday.model.Admins;

public interface FrontSystemddlServiceI {

	List<PageSystemddl> getSystemddlByParentId(String id) throws Exception;

	

}
