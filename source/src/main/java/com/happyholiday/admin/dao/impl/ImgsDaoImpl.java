package com.happyholiday.admin.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.dao.ImgsDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Imgs;
@Repository("imgsDao")
public class ImgsDaoImpl extends BaseDaoImpl<Imgs> implements ImgsDaoI{
	
}
