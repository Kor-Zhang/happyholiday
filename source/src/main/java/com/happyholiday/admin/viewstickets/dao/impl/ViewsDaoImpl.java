package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.ViewsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketViews;

@Repository("viewsdao")
public class ViewsDaoImpl extends BaseDaoImpl<ViewticketViews> implements ViewsDaoI {

}
