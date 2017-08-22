package com.happyholiday.front.car.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.car.Static;
import com.happyholiday.front.car.dao.CarOrderDaoI;
import com.happyholiday.front.car.pageModel.PageOrder;
import com.happyholiday.front.car.service.CarOrderServiceI;
import com.happyholiday.front.car.util.Tools;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Cars;
import com.happyholiday.model.Orders;
import com.happyholiday.model.Users;
@Service(value = "frontCarOrderService")
public class CarOrderServiceImpl implements CarOrderServiceI{
	
	//配置DAO
	private CarOrderDaoI frontCarOrderDao;
	
	public CarOrderDaoI getCarOrderDao() {
		return frontCarOrderDao;
	}
	@Autowired
	public void setCarOrderDao(CarOrderDaoI frontCarOrderDao) {
		this.frontCarOrderDao = frontCarOrderDao;
	}

	@Override
	public Orders saveOrder(PageOrder pageOrder) throws Exception {
		System.out.println(pageOrder.getGetCarTime());
		// TODO 自动生成的方法存根
		Orders od = new Orders();
		BeanUtils.copyProperties(pageOrder, od);
		System.out.println(od);
	
		//设置car
		Cars car = new Cars();
		car.setId(pageOrder.getCarId());
		od.setCars(car);
		//设置user
		Users user = Tools.getSessionObject(Static.ONLINE_USER);
		od.setUsers(user);
		
		//设置其他属性
		od.setId(UUID.randomUUID().toString());
		od.setSubmitTime(new Timestamp(new Date().getTime()));
		//订单状态
		od.setStatus(Static.ORDER_STATUS_UNDEAL);
		od.setIsDelete(false);
		frontCarOrderDao.save(od);
		return od;
	}
	@Override
	public List<PageOrder> getOrders(PageOrder pageOrder) throws Exception {
		// TODO 自动生成的方法存根
		//获取UserId
		Users user = Tools.getSessionObject(Static.ONLINE_USER);
		List<Orders> orders =new ArrayList<Orders>();
		String hql = "from Orders t   where 1=1 and userId='"+user.getId()+"'";
		if(pageOrder.getType().equals("全部")){
			hql+="";
		}
		if(pageOrder.getType().equals("预定成功")){
			hql=hql+"and t.status ="+0;
		}
		if(pageOrder.getType().equals("租赁中")){
			hql=hql+"and t.status ="+1;
		}
		if(pageOrder.getType().equals("已完成")){
			hql=hql+"and t.status ="+2;
		}
		if(pageOrder.getType().equals("已取消")){
			hql=hql+" and t.status ="+ -1+"or t.status ="+ -2;
		}
		Map<String,Object> params = Tools.getHashMap();
		System.out.println(pageOrder.getStartTime().toString());
		boolean b = pageOrder.getStartTime().toString().equals("1990-01-01 00:00:00.0");
		System.out.println(b);
		if(!pageOrder.getStartTime().toString().equals("1990-01-01 00:00:00.0")){
			params.put("min",pageOrder.getStartTime());
			params.put("max", pageOrder.getEndTime());
			hql=hql+"  and t.submitTime<= :max and  t.submitTime>=:min";
		}
		orders = frontCarOrderDao.get(hql, params,pageOrder.getPage(), pageOrder.getRows());
		List<PageOrder> order = Tools.copyPropertiesList(orders, PageOrder.class);	
		
		//设置汽车属性
		for(int i=0;i<orders.size();i++){
			order.get(i).setCarBd(orders.get(i).getCars().getCarBd());
			order.get(i).setSeatType(orders.get(i).getCars().getSeatType());
			order.get(i).setSeatNumber(orders.get(i).getCars().getSeatNumber());
			order.get(i).setDrivingMode(orders.get(i).getCars().getDrivingMode());
			//设置imgname
			Set<Carimgs> carImgs =  orders.get(i).getCars().getCarimgses();
			for (Carimgs ci : carImgs) {
				if(ci.getMain()){
					order.get(i).setMainImgName(ci.getImgs().getImgName());
				}
			}
		}
		
		return order;
	}
	@Override
	public void cancelOrder(PageOrder pageOrder) throws Exception {
		// TODO 自动生成的方法存根
		String hql = "from Orders t   where 1=1 and id='"+pageOrder.getId()+"'";
		Orders order = frontCarOrderDao.find(hql);
		order.setStatus(-1);
		frontCarOrderDao.save(order);
	}

}
