package com.happyholiday.admin.cars.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.cars.dao.RecommendCarsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Recommendcars;
@Repository("recommendCarsDao")
public class RecommendCarsDaoImpl extends BaseDaoImpl<Recommendcars> implements RecommendCarsDaoI{
	
}
