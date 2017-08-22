package com.happyholiday.front.officialwebsite.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.alibaba.druid.filter.AutoLoad;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.front.officialwebsite.dao.OwIndexCarouselDaoI;
import com.happyholiday.front.officialwebsite.dao.OwIndexDisplayDaoI;
import com.happyholiday.front.officialwebsite.dao.OwNewsDaoI;
import com.happyholiday.model.OfficialwebsiteIndexCarousel;
import com.happyholiday.model.OfficialwebsiteIndexDisplay;
import com.happyholiday.model.OfficialwebsiteNews;
@Repository(value="owINewsDao")
public class OwINewsDaoImpl extends BaseDaoImpl<OfficialwebsiteNews> implements OwNewsDaoI{
	
}
