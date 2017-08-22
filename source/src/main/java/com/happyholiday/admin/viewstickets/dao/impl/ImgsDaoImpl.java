package com.happyholiday.admin.viewstickets.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.viewstickets.dao.ImgsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Imgs;

@Repository("imgsViewsdao")
public class ImgsDaoImpl  extends BaseDaoImpl<Imgs> implements ImgsDaoI{
		
}
