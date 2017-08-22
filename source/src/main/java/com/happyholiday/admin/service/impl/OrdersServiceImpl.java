package com.happyholiday.admin.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.cars.dao.OrdersDaoI;
import com.happyholiday.admin.cars.dao.RentCarCostDaoI;
import com.happyholiday.admin.cars.pageModel.PageOrders;
import com.happyholiday.admin.cars.pageModel.PageRentCarCost;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.OrdersException;
import com.happyholiday.admin.service.OrdersServiceI;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Orders;
import com.happyholiday.model.Rentcarcost;

@Service(value = "ordersService")
public class OrdersServiceImpl implements OrdersServiceI {
	//注入ordersdao
	private OrdersDaoI ordersDao;

	public OrdersDaoI getOrdersDao() {
		return ordersDao;
	}
	@Autowired
	public void setOrdersDao(OrdersDaoI ordersDao) {
		this.ordersDao = ordersDao;
	}
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
	public BackReturnJSON<PageOrders> getOrdersDatagrid(Admins onlineAdmin,
			PageOrders pageModel) throws Exception {
		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证101权限（查询订单权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_ORDER)){
			throw new AdminsException("您没有查询订单权限！");
		}
		//2.查询
		BackReturnJSON<PageOrders> retJSON = new BackReturnJSON<PageOrders>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_ORDERS+" t where t.isDelete=false ");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_ORDERS+" t where t.isDelete=false ");
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
		List<Orders> beanList = ordersDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//转化模型
		List<PageOrders> tempRows = BackTools.copyPropertiesList(beanList, PageOrders.class);
		List<PageOrders> rows = BackTools.getArrayList();
		//查询total
		Integer total = ordersDao.length(totalHql.toString(),params);
		//设置carId; rentCarUersId;userId;
		int index = 0;
		for (Orders b : beanList) {
			PageOrders temp = tempRows.get(index);
			temp.setUserId(b.getUsers().getId());
			temp.setCarId(b.getCars().getId());
			/*temp.setRentCarUersId(b.getRentcarusers().getId());*/
			rows.add(temp);
			index++;
		}
		retJSON.setRows(rows);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
	}

	
	@Override
	public void updateOrdersStatus(Admins onlineAdmin, PageOrders pageModel)
			throws Exception {
		
		/**
		 * 1.判断用户是否有权限
		 * 2.更新
		 */
		//验证102权限（更新订单权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_ORDER)){
			throw new AdminsException("您没有更新订单权限！");
		}
		//数据库的order，pageModel为用户修改后的model
		Orders order = new Orders(); 
		order = ordersDao.findById(Orders.class,pageModel.getId());
		
		//2.更新
		//如果数据库中订单被用户取消，那么管理员无法操作
		if(order.getStatus()==BackStatic.ORDER_STATUS_USER_CANCEL){
			throw new OrdersException("不能操作用户已取消的订单！");
		}else if(pageModel.getStatus()==BackStatic.ORDER_STATUS_UNDEAL){
			
			//如果为提交订单，车辆未提取状态，不做处理
			order.setRealGetCarAddress(null);
			order.setRealGetCarTime(null);
			order.setStatus(BackStatic.ORDER_STATUS_UNDEAL);
			order.setRealReturnCarAddress(null);
			order.setRealReturnCarTime(null);
			
		//提取车辆状态，获得其还车参数
		}else if(pageModel.getStatus()==BackStatic.ORDER_STATUS_GETCAR){
			String realGetCarAddress = pageModel.getRealGetCarAddress();
			Timestamp realGetCarTime = pageModel.getRealGetCarTime(); 
			order.setRealGetCarAddress(realGetCarAddress);
			order.setRealGetCarTime(realGetCarTime);
			order.setStatus(BackStatic.ORDER_STATUS_GETCAR);
			order.setRealReturnCarAddress(null);
			order.setRealReturnCarTime(null);
		//还车状态
		}else if(pageModel.getStatus()==BackStatic.ORDER_STATUS_RETURNCAR){
			//如果跳过了租赁状态，补全提取信息信息
			if(order.getStatus()!=BackStatic.ORDER_STATUS_GETCAR){
				order.setRealGetCarTime(order.getGetCarTime());
				order.setRealGetCarAddress(order.getGetCarAddress());
			}
			String realReturnCarAddress = pageModel.getRealReturnCarAddress();
			Timestamp realReturnCarTime = pageModel.getRealReturnCarTime(); 
			order.setRealReturnCarAddress(realReturnCarAddress);
			order.setRealReturnCarTime(realReturnCarTime);
			order.setStatus(BackStatic.ORDER_STATUS_RETURNCAR);
		}else if(pageModel.getStatus()==BackStatic.ORDER_STATUS_ADMIN_CANCEL){
			//如果管理员拒绝租车
			if(order.getStatus()!=BackStatic.ORDER_STATUS_UNDEAL){
				/*order.setRealGetCarTime(order.getGetCarTime());
				order.setRealGetCarAddress(order.getGetCarAddress());*/
				throw new OrdersException("不能拒绝操作已处理的订单！");
			}
			order.setStatus(BackStatic.ORDER_STATUS_ADMIN_CANCEL);
			ordersDao.update(order);
		}
		
		
	}
	@Override
	public void updateOrdersAdminNote(Admins onlineAdmin,
			PageOrders pageModel) throws Exception {
		//验证102权限（更新管理员备注汽车权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_ORDER)){
			throw new AdminsException("您没有更新管理员备注权限！");
		}
		String newNote= pageModel.getAdminNote();
		Orders dBOrder = ordersDao.find("from Orders t where t.id=:id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageModel.getId()}));
		dBOrder.setAdminNote(newNote);
		ordersDao.update(dBOrder);
	}
	@Override
	public BackReturnJSON<PageRentCarCost> getCostDataByOrderId(Admins onlineAdmin, PageOrders pageModel)
			throws Exception {
		//验证101权限（查询订单权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_ORDER)){
			throw new AdminsException("您没有查询订单权限！");
		}
		//2.查询
		BackReturnJSON<PageRentCarCost> retJSON = new BackReturnJSON<PageRentCarCost>();
		Map<String,Object> params = BackTools.getHashMap();
		params.put("id", pageModel.getId());
		//hql语句，不查询当前用户和超级管理员们
		StringBuffer totalHql = new StringBuffer("select count(*) from "+BackStatic.HQL_TABLE_NAME_RENTCARCOST+" t where t.isDelete=false and t.orders.id=:id");
		StringBuffer rowsHql = new StringBuffer("from "+BackStatic.HQL_TABLE_NAME_RENTCARCOST+" t where t.isDelete=false and t.orders.id=:id");
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
		//设置introduction和name
		int index = 0;
		for (Rentcarcost b : beanList) {
			PageRentCarCost row = rows.get(index);
			row.setCostIntroduction(b.getCost().getIntroduction());
			row.setCostName(b.getCost().getName());
			index++; 
		}
		
		retJSON.setRows(rows);
		//设置订单信息（主要用于去取出总价和租车价格）
		Orders od = ordersDao.findById(Orders.class,pageModel.getId());
		PageOrders pod = new PageOrders();
		BeanUtils.copyProperties(od, pod);
		retJSON.setObj(pod);
		retJSON.setTotal(total);
		//3.返回结果
		return retJSON;
		
	}
	
	

}
