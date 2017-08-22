package com.happyholiday.front.car.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.car.service.IndexServiceI;
import com.happyholiday.front.car.util.Tools;
import com.happyholiday.dao.IndexDaoI;
import com.happyholiday.model.Indexcarousels;
import com.happyholiday.pagemodel.PageIndex;
@Service(value = "indexService")
public class IndexServiceImpl implements IndexServiceI {
		private  IndexDaoI indexDao ;

		public IndexDaoI getIndexDao() {
			return indexDao;
		}
		@Autowired
		public void setIndexDao(IndexDaoI indexDao) {
			this.indexDao = indexDao;
		}
		@Override
		public List<PageIndex> getCarouselsImg(PageIndex pageIndex) throws Exception {
			// TODO 自动生成的方法存根
			List<Indexcarousels> ic = new ArrayList<Indexcarousels>();
			String hql ="from Indexcarousels where 1=1";
			ic = indexDao.get(hql);
			List<PageIndex> pi = Tools.copyPropertiesList(ic, PageIndex.class);
			int i=0;
			for (PageIndex page: pi) {
				page.setCarouselsImgName(ic.get(i).getImgs().getImgName());
				i++;
			}
		    return pi;
		}
		
		
}
