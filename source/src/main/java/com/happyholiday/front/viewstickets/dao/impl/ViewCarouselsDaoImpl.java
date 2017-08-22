package com.happyholiday.front.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.viewstickets.dao.ViewCarouselsDaoI;
import com.happyholiday.model.ViewticketCarousels;
@Repository("frontViewCarouselsdao")
public class ViewCarouselsDaoImpl extends BaseDaoImpl<ViewticketCarousels> implements ViewCarouselsDaoI {

}
