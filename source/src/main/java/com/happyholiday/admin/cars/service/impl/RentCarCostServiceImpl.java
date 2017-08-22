package com.happyholiday.admin.cars.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.dao.RentCarCostDaoI;
import com.happyholiday.admin.cars.exception.CarsException;
import com.happyholiday.admin.cars.pageModel.PageCarImgUpload;
import com.happyholiday.admin.cars.pageModel.PageCars;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.cars.service.RentCarCostServiceI;
import com.happyholiday.admin.dao.ImgsDaoI;
import com.happyholiday.admin.dao.IndexCarouselsDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.IndexCarouselsException;
import com.happyholiday.admin.pageModel.PageIndexCarousels;
import com.happyholiday.admin.pageModel.PageIndexCarouselsUpload;
import com.happyholiday.admin.service.IndexCarouselsServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Imgs;
import com.happyholiday.model.Indexcarousels;
import com.happyholiday.model.Rentcarcost;

@Service(value = "rentCarCostService")
public class RentCarCostServiceImpl implements RentCarCostServiceI {
	//	注入rentCarCostDao
	private RentCarCostDaoI rentCarCostDao;

	public RentCarCostDaoI getRentCarCostDao() {
		return rentCarCostDao;
	}
	@Autowired
	public void setRentCarCostDao(RentCarCostDaoI rentCarCostDao) {
		this.rentCarCostDao = rentCarCostDao;
	}
	@Override
	public BackReturnJSON<PageRentCarCost> getDatagrid(Admins onlineAdmin,
			PageRentCarCost pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证503权限（查看租车费用权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_COST)){
			throw new AdminsException("您没有查看租车费用权限！");
		}
		//2.查询
		BackReturnJSON<PageRentCarCost> retJSON = new BackReturnJSON<PageRentCarCost>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_RENTCARCOST+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_RENTCARCOST+" t where t.isDelete=false ");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = BackTools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		BackTools.setSearchWhere(hqls, pageModel, params);
		BackTools.setSortOrder(hqls, pageModel);
		//查询记录
		List<Rentcarcost> beanList = rentCarCostDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageRentCarCost> rows = BackTools.copyPropertiesList(beanList, PageRentCarCost.class);
		
		//查询total
		Integer total = rentCarCostDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	
}
	
	