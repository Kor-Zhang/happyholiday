package com.happyholiday.front.car.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.car.dao.RentCarCostDaoI;
import com.happyholiday.front.car.pageModel.PageRentCarCost;
import com.happyholiday.front.car.service.RentCarCostServiceI;
import com.happyholiday.model.Cost;
import com.happyholiday.model.Orders;
import com.happyholiday.model.Rentcarcost;

@Service(value = "frontRentCarCostService")
public class RentCarCostServiceImpl  implements RentCarCostServiceI{
		//配置Dao
	   private RentCarCostDaoI  frontRentCarCostDao;

	public RentCarCostDaoI getFrontRentCarCostDao() {
		return frontRentCarCostDao;
	}
    @Autowired
	public void setFrontRentCarCostDao(RentCarCostDaoI frontRentCarCostDao) {
		this.frontRentCarCostDao = frontRentCarCostDao;
	}
	@Override
	public void saveCarCostInfo(PageRentCarCost pageRentCarCost)
			throws Exception {
		// TODO 自动生成的方法存根
		Rentcarcost ct  =new Rentcarcost();
		ct.setId(UUID.randomUUID().toString());
		//设置费用表
		System.out.println(pageRentCarCost.getCostId());
		System.out.println(pageRentCarCost.getPrice());
		Cost  cost  = new Cost();
		cost.setId(pageRentCarCost.getCostId());
		ct.setCost(cost);
		//设置订单
		Orders  order = new Orders();
		order.setId(pageRentCarCost.getOrderId());
		ct.setOrders(order);
		
		ct.setNumber(pageRentCarCost.getNumber());
		ct.setPrice(pageRentCarCost.getPrice());
		ct.setCreateTime(new Timestamp(new Date().getTime()));
		ct.setUpdateTime(ct.getCreateTime());
		ct.setIsDelete(false);
		//保存
		frontRentCarCostDao.save(ct);
	}
	  
    
}
