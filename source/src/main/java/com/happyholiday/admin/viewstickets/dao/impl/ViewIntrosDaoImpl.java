package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.ViewIntrosDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketViewsIntroductions;
import com.opensymphony.xwork2.ModelDriven;
@Repository("viewIntrosdao")
public class ViewIntrosDaoImpl extends BaseDaoImpl<ViewticketViewsIntroductions> implements ViewIntrosDaoI{
	
}
