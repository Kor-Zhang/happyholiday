package com.happyholiday.front.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.viewstickets.dao.RecommendViewDaoI;
import com.happyholiday.model.ViewticketRecommendviews;
@Repository("frontRecommendViewdao")
public class RecommendViewDaoImpl extends BaseDaoImpl<ViewticketRecommendviews> implements RecommendViewDaoI{

}
