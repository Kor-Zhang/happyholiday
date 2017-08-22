package com.happyholiday.admin.dao.impl;

import org.springframework.stereotype.Repository;

import com.happyholiday.admin.dao.NoticesDaoI;
import com.happyholiday.dao.impl.BaseDaoImpl;
import com.happyholiday.model.Notices;
@Repository("noticesDao")
public class NoticesDaoImpl extends BaseDaoImpl<Notices> implements NoticesDaoI{
	
}
