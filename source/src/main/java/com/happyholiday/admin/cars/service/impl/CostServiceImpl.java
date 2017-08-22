package com.happyholiday.admin.cars.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.dao.CostDaoI;
import com.happyholiday.admin.cars.pageModel.PageCost;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.cars.service.CostServiceI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Cost;
import com.happyholiday.model.Rentcarcost;

@Service(value = "costService")
public class CostServiceImpl implements CostServiceI {
	//	注入costDao
	private CostDaoI costDao;

	
	public CostDaoI getCostDao() {
		return costDao;
	}

	@Autowired
	public void setCostDao(CostDaoI costDao) {
		this.costDao = costDao;
	}


	@Override
	public BackReturnJSON<PageCost> getDatagrid(Admins onlineAdmin,
			PageCost pageModel) throws Exception {
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
		BackReturnJSON<PageCost> retJSON = new BackReturnJSON<PageCost>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_COST+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_COST+" t where t.isDelete=false ");
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
		List<Cost> beanList = costDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageCost> rows = BackTools.copyPropertiesList(beanList, PageCost.class);
		
		//查询total
		Integer total = costDao.length(totalHql.toString(),params);

		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}
	@Override
	public void editCost(Admins onlineAdmin,
			PageCost pageModel) throws Exception {
		//验证504权限（更新租车费用权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_COST)){
			throw new AdminsException("您没有更新租车费用权限！");
		}
		//修改
		Cost cost = costDao.findById(Cost.class, pageModel.getId());
		cost.setUpdateTime(new Timestamp(new Date().getTime()));
		cost.setName(pageModel.getName());
		cost.setIntroduction(pageModel.getIntroduction());
		cost.setPrice(pageModel.getPrice());
		
	}

	@Override
	public void addCost(Admins onlineAdmin, PageCost pageModel)
			throws Exception {
		//验证501权限（增加租车费用权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_COST)){
			throw new AdminsException("您没有增加租车费用权限！");
		}
		//修改
		Cost cost = new Cost();
		//copy属性
		BeanUtils.copyProperties(pageModel, cost);
		//手动设置属性设置
		Timestamp now = new Timestamp(new Date().getTime());
		cost.setUpdateTime(now);
		cost.setCreateTime(now);
		cost.setBelong(BackStatic.COST_CAR);
		cost.setId(UUID.randomUUID().toString());
		cost.setIsDelete(false);
		costDao.save(cost);
	}

	@Override
	public void deleteCost(Admins onlineAdmin, PageCost pageModel)
			throws Exception {
		//验证502权限（删除租车费用权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_COST)){
			throw new AdminsException("您没有删除租车费用权限！");
		}
		String[] deleteIds = pageModel.getDeleteIds().split(",");
		for (int index = 0; index < deleteIds.length; index++) {
			Cost cost = new Cost();
			cost.setId(deleteIds[index]);
			costDao.delete(cost);
		}
		
	}
}
	
	