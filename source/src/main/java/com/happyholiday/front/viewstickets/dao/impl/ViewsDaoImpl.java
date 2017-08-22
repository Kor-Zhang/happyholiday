package com.happyholiday.front.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;



import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.viewstickets.dao.ViewsDaoI;
import com.happyholiday.model.ViewticketViews;
@Repository("frontViewsdao")
public class ViewsDaoImpl extends BaseDaoImpl<ViewticketViews> implements ViewsDaoI{

}
