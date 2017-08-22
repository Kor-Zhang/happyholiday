package com.happyholiday.front.car.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.front.car.dao.RecommendCarsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Recommendcars;
@Repository("frontRcmdCarDao")
public class RecommendCarsDaoImpl extends BaseDaoImpl<Recommendcars> implements RecommendCarsDaoI{

}
