package com.happyholiday.front.viewstickets.service.impl;

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

import com.happyholiday.front.viewstickets.Static;
import com.happyholiday.front.viewstickets.dao.UserDaoI;
import com.happyholiday.front.viewstickets.dao.ViewOrderDaoI;
import com.happyholiday.front.viewstickets.dao.ViewTicketDaoI;
import com.happyholiday.front.viewstickets.dao.ViewsDaoI;
import com.happyholiday.front.viewstickets.pageModel.PageViewOrder;
import com.happyholiday.front.viewstickets.service.ViewOrderServiceI;
import com.happyholiday.front.viewstickets.util.ReturnJSON;
import com.happyholiday.front.viewstickets.util.Tools;
import com.happyholiday.model.Users;
import com.happyholiday.model.ViewticketOrders;
import com.happyholiday.model.ViewticketTickets;
import com.happyholiday.model.ViewticketViews;
import com.happyholiday.model.ViewticketViewsImgs;
@Service("frontViewOrderservice")
public class ViewOrderServiceImpl implements ViewOrderServiceI{
	
	//配置dao
	private  ViewOrderDaoI frontViewOrderdao;
	
	public ViewOrderDaoI getFrontViewOrderdao() {
		return frontViewOrderdao;
	}
	@Autowired
	public void setFrontViewOrderdao(ViewOrderDaoI frontViewOrderdao) {
		this.frontViewOrderdao = frontViewOrderdao;
	}
	
	public ViewTicketDaoI frontViewTicketdao;
	public ViewTicketDaoI getFrontViewTicketdao() {
		return frontViewTicketdao;
	}
	@Autowired
	public void setFrontViewTicketdao(ViewTicketDaoI frontViewTicketdao) {
		this.frontViewTicketdao = frontViewTicketdao;
	}
	
	public UserDaoI viewUserdao;
	public UserDaoI getViewUserdao() {
		return viewUserdao;
	}
	@Autowired
	public void setViewUserdao(UserDaoI viewUserdao) {
		this.viewUserdao = viewUserdao;
	}
	
	public ViewsDaoI frontViewsdao;
	
	public ViewsDaoI getFrontViewsdao() {
		return frontViewsdao;
	}
	@Autowired
	public void setFrontViewsdao(ViewsDaoI frontViewsdao) {
		this.frontViewsdao = frontViewsdao;
	}
	@Override
	public void addOrder(PageViewOrder pageModel) throws Exception {
		// TODO 自动生成的方法存根
		ViewticketOrders order = new ViewticketOrders();	
		ViewticketTickets ticket = frontViewTicketdao.findById(ViewticketTickets.class,pageModel.getTicketId());
		Users user = viewUserdao.findById(Users.class, pageModel.getUserId());
		BeanUtils.copyProperties(pageModel, order);
		order.setId(UUID.randomUUID().toString());
		order.setIsDelete(false);
		order.setCreateTime(new Timestamp(new Date().getTime()));
		order.setViewticketTickets(ticket);
		order.setUsers(user);
		order.setStatus(Static.ORDER_STATUS_PAY);
		//写入数据库
		frontViewOrderdao.save(order);
		
		//下单完成 销量增加
		Integer sales = ticket.getViewticketViews().getSalesNumber()+1;
		ViewticketViews view = ticket.getViewticketViews();
		view.setSalesNumber(sales);
		frontViewsdao.save(view);
		}
	@Override
	public ReturnJSON<PageViewOrder> getOrders(PageViewOrder pageModel)
			throws Exception {
		// TODO Auto-generated method stub
		//设置返回值
		ReturnJSON<PageViewOrder> retJson = new ReturnJSON<PageViewOrder>();
		//获取UserId
		Users user = Tools.getSessionObject(com.happyholiday.front.user.Static.ONLINE_USER);
		List<ViewticketOrders> orders  = new ArrayList<ViewticketOrders>();
		List<ViewticketOrders> ordersTotal  = new ArrayList<ViewticketOrders>();
		String hql = "from ViewticketOrders t   where 1=1 and userId='"+user.getId()+"'";
		if(pageModel.getType().equals("全部")){
			hql+="";
		}
		if(pageModel.getType().equals("未付款")){
			hql=hql+"and t.status ="+Static.ORDER_STATUS_NOPAY;
		}
		if(pageModel.getType().equals("已付款")){
			hql=hql+"and t.status ="+Static.ORDER_STATUS_PAY;
		}
		if(pageModel.getType().equals("已完成")){
			hql=hql+"and t.status ="+Static.ORDER_STATUS_SUCCESS;
		}
		if(pageModel.getType().equals("已取消")){
			hql=hql+" and t.status ="+ Static.ORDER_STATUS_AMIND+"or t.status ="+ Static.ORDER_STATUS_USER;
		} 
		Map<String,Object> params = Tools.getHashMap();
		boolean b = pageModel.getStartTime().toString().equals("1990-01-01 00:00:00.0");
		if(!pageModel.getStartTime().toString().equals("1990-01-01 00:00:00.0")){
			params.put("min",pageModel.getStartTime());
			params.put("max", pageModel.getEndTime());
			hql=hql+"  and t.travelTime<= :max and  t.travelTime>=:min";
		}
		orders = frontViewOrderdao.get(hql, params,pageModel.getPage(), pageModel.getRows());
		ordersTotal = frontViewOrderdao.get(hql);
		List<PageViewOrder> order = Tools.copyPropertiesList(orders, PageViewOrder.class);
		//设置属性开始
		for(int i =0;i<orders.size();i++){
			order.get(i).setViewName(orders.get(i).getViewticketTickets().getViewticketViews().getName());
			order.get(i).setViewAddress(orders.get(i).getViewticketTickets().getViewticketViews().getAddress());
			order.get(i).setViewGrade(orders.get(i).getViewticketTickets().getViewticketViews().getGrade());
			//设置imgName;
			Set<ViewticketViewsImgs> viewImgs =  orders.get(i).getViewticketTickets().getViewticketViews().getViewticketViewsImgses();
			for (ViewticketViewsImgs vvi : viewImgs) {
				if(vvi.getMain()){
					order.get(i).setImgName(vvi.getImgs().getImgName());
				}
			}
		
		}
		retJson.setRows(order);
		//设置总数
		retJson.setTotal(ordersTotal.size());
		return retJson;
	}
	@Override
	public void cancelOrder(PageViewOrder pageModel) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from ViewticketOrders t   where 1=1 and id='"+pageModel.getId()+"'";
		ViewticketOrders order = frontViewOrderdao.find(hql);
		order.setStatus(Static.ORDER_STATUS_USER);
		frontViewOrderdao.save(order);
	}

}
