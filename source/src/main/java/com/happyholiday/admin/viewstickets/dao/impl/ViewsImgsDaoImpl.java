package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.ViewsImgsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketViewsImgs;

@Repository("viewsImgsdao")
public class ViewsImgsDaoImpl extends BaseDaoImpl<ViewticketViewsImgs> implements ViewsImgsDaoI{

}
