package com.happyholiday.front.officialwebsite.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.alibaba.druid.filter.AutoLoad;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.officialwebsite.dao.OwIndexCarouselDaoI;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
@Repository(value="owIndexCarouselDao")
public class OwIndexCarouselDaoImpl extends BaseDaoImpl<OfficialwebsiteIndexCarousel> implements OwIndexCarouselDaoI{
	
}
