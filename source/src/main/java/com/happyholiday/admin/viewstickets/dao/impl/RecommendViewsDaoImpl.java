package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.RecommendViewsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.ViewticketRecommendviews;

@Repository("recommendViewsdao")
public class RecommendViewsDaoImpl extends BaseDaoImpl<ViewticketRecommendviews> implements RecommendViewsDaoI{

}
