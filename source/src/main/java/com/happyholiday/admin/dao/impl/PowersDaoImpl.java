package com.happyholiday.admin.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.dao.PowersDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Powers;
@Repository("powersDao")
public class PowersDaoImpl extends BaseDaoImpl<Powers> implements PowersDaoI{
	
}
