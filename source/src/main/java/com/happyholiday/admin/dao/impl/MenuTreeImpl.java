package com.happyholiday.admin.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.dao.MenuTreeDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Menutree;
@Repository("menuTreeDao")
public class MenuTreeImpl extends BaseDaoImpl<Menutree> implements MenuTreeDaoI {
	
}
