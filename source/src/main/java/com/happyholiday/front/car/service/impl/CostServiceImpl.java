package com.happyholiday.front.car.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.car.dao.CostDaoI;
import com.happyholiday.front.car.pageModel.PageCost;
import com.happyholiday.front.car.service.CostServiceI;
import com.happyholiday.front.car.util.Tools;
import com.happyholiday.model.Cost;

@Service(value = "frontCarCostService")
public class CostServiceImpl implements CostServiceI {
		
	private CostDaoI frontCarCostDao;
	public CostDaoI getCostDao() {
		return frontCarCostDao;
	}	
	@Autowired
	public void setCostDao(CostDaoI costDao) {
		this.frontCarCostDao = costDao;
	}

	@Override
	public List<PageCost> getCostInfo() throws Exception {
		// TODO 自动生成的方法存根
		String hql ="from Cost where 1=1";
		List<Cost> cost  =frontCarCostDao.get(hql);
		List<PageCost> pageCost = new ArrayList<PageCost>();
		pageCost = Tools.copyPropertiesList(cost, PageCost.class);
		return pageCost;
	}

}
