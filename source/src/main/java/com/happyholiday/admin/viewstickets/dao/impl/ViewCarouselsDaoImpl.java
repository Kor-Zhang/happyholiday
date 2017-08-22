package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.ViewCarouselsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketCarousels;

@Repository("viewCarouselsdao")
public class ViewCarouselsDaoImpl extends BaseDaoImpl<ViewticketCarousels> implements ViewCarouselsDaoI{

}
