package com.happyholiday.admin.viewstickets.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.viewstickets.dao.ViewTicketsDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewsDaoI;
import com.happyholiday.admin.viewstickets.pageModel.PageViewTickets;
import com.happyholiday.admin.viewstickets.service.ViewTicketsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.ViewticketTickets;
import com.happyholiday.model.ViewticketViews;
@Service(value="viewTicketsService")
public class ViewTicketsServiceImpl  implements ViewTicketsServiceI{

	//配置viewTicketsdao
	private ViewTicketsDaoI viewTicketsdao;
	public ViewTicketsDaoI getViewTicketsdao() {
		return viewTicketsdao;
	}
	@Autowired
	public void setViewTicketsdao(ViewTicketsDaoI viewTicketsdao) {
		this.viewTicketsdao = viewTicketsdao;
	}
	//配置Dao
			private ViewsDaoI viewsdao;
			public ViewsDaoI getViewsdao() {
				return viewsdao;
			}
			@Autowired
			public void setViewsdao(ViewsDaoI viewsdao) {
				this.viewsdao = viewsdao;
			}

	@Override
	public ReturnJSON<PageViewTickets> getViewTicketsDatagrid(
			PageViewTickets pageViewTickets,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEWTICKET_LIST);
		//查询
		System.out.println("价格区间:"+pageViewTickets.getMaxHappyPrice()+"::"+pageViewTickets.getMinHappyPrice());
		
		ReturnJSON<PageViewTickets> dg = new ReturnJSON<PageViewTickets>();
		Map<String, Object> params = Tools.getHashMap();
		//hql语句
		StringBuffer totalHql = new StringBuffer("select count(*) from ViewticketTickets t where  t.isDelete = false");
		StringBuffer rowsHql = new StringBuffer("from ViewticketTickets  t where  t.isDelete = false");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = Tools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加where
		Tools.setSearchWhere(hqls, pageViewTickets, params);
		List<ViewticketTickets> beanList = viewTicketsdao.get(rowsHql.toString(), params, pageViewTickets.getPage(), pageViewTickets.getRows());
		//所有数据
		List<PageViewTickets> rows = Tools.copyPropertiesList(beanList, PageViewTickets.class);
		for(int i=0;i<beanList.size();i++){
			rows.get(i).setViewId(beanList.get(i).getViewticketViews().getId());
		}
		Integer total = viewTicketsdao.length(totalHql.toString(), params);
		//设置JSON属性
		dg.setRows(rows);
		dg.setTotal(total);
		return dg;
	}
	@Override
	public void addViewTicket(PageViewTickets pageModel,Admins onlineAdmin) throws Exception {

		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_VIEWTICKET_LIST);
		//先判断参数是否为空
		if(pageModel.getViewName()==null){
			throw new Exception("该区域没有景区！！请先添加景区");
		}
		checkTicket(pageModel);
		ViewticketViews view = viewsdao.find("from ViewticketViews where isDelete = false and name ='"+pageModel.getViewName()+"'");
		
		ViewticketTickets viewTicket = new ViewticketTickets();
		BeanUtils.copyProperties(pageModel, viewTicket);
		viewTicket.setViewticketViews(view);
		viewTicket.setId(UUID.randomUUID().toString());
		viewTicket.setCreatTime(new Timestamp(new Date().getTime()));
		viewTicket.setIsDelete(false);
		
		//写入数据库
		viewTicketsdao.save(viewTicket);
	}
	
	
	
	public void checkTicket(PageViewTickets pageModel) throws Exception{
		if(pageModel.getName().trim().length()==0){
			throw new Exception("请输入门票名");
		}
		if(pageModel.getOrderTime().trim().length()==0){
			throw new Exception("请输入提取预定时间");
		}
		if(pageModel.getMarketPrice()==null){
			throw new Exception("请输入市场价格");
		}
		if(pageModel.getHappyPrice()==null){
			throw new Exception("请输入幸福价格");
		}
	}
	@Override
	public void deleteViewTicket(PageViewTickets pageModel,Admins onlineAdmin) throws Exception {

		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_VIEWTICKET_LIST);
		ViewticketTickets viewTicket = viewTicketsdao.find("from ViewticketTickets where  id='"+pageModel.getId()+"'");
		viewTicket.setIsDelete(true);
		viewTicketsdao.update(viewTicket);
	}
	@Override
	public void updateViewTicket(PageViewTickets pageModel,Admins onlineAdmin) throws Exception {

		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_VIEWTICKET_LIST);
		checkTicket(pageModel);
		//修改下拉框的值
		pageModel.setType(pageModel.getType().split(", ")[1]);
		pageModel.setStyle(pageModel.getStyle().split(", ")[1]);
		pageModel.setPayType(pageModel.getPayType().split(", ")[1]);
		
		ViewticketTickets viewTicket = viewTicketsdao.find("from ViewticketTickets where  id='"+pageModel.getId()+"'");
		//设置修改的值
		viewTicket.setName(pageModel.getName());
		viewTicket.setType(pageModel.getType());
		viewTicket.setStyle(pageModel.getStyle());
		viewTicket.setOrderTime(pageModel.getOrderTime());
		viewTicket.setMarketPrice(pageModel.getMarketPrice());
		viewTicket.setHappyPrice(pageModel.getHappyPrice());
		viewTicket.setPayType(pageModel.getPayType());
		viewTicket.setCreatTime(new Timestamp(new Date().getTime()));
		//写入数据库
		viewTicketsdao.update(viewTicket);
		
		
	}
	@Override
	public ReturnJSON<PageViewTickets> getOneViewTicket(
			PageViewTickets pageViewTickets,Admins onlineAdmin) throws Exception {

		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEWTICKET_LIST);	List<ViewticketTickets> viewTicketList = viewTicketsdao.get("from ViewticketTickets where id='"+pageViewTickets.getId()+"'");
		ReturnJSON<PageViewTickets> dg = new ReturnJSON<PageViewTickets>();
		List<PageViewTickets> rows = Tools.copyPropertiesList(viewTicketList, PageViewTickets.class);
		dg.setRows(rows);
		dg.setTotal(rows.size());
		return dg;
	}
}
