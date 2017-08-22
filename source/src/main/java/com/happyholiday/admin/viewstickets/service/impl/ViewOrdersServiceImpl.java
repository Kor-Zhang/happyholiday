package com.happyholiday.admin.viewstickets.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.viewstickets.dao.ViewOrdersDaoI;
import com.happyholiday.admin.viewstickets.pageModel.PageViewOrders;
import com.happyholiday.admin.viewstickets.service.ViewOrdersServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.ViewticketOrders;
@Service(value="viewOrdersService")
public class ViewOrdersServiceImpl implements ViewOrdersServiceI {
	//配置dao
	private ViewOrdersDaoI viewOrdersdao;
	
	public ViewOrdersDaoI getViewOrdersdao() {
		return viewOrdersdao;
	}
	@Autowired
	public void setViewOrdersdao(ViewOrdersDaoI viewOrdersdao) {
		this.viewOrdersdao = viewOrdersdao;
	}

	@Override
	public ReturnJSON<PageViewOrders> getViewOrdersDatagrid(
			PageViewOrders pageModel,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEWTICKET_ORDER);

		//查询
		ReturnJSON<PageViewOrders> dg = new ReturnJSON<>();
		Map<String, Object> params = Tools.getHashMap();
		//hql语句
		StringBuffer totalHql = new StringBuffer("select count(*) from ViewticketOrders t where  t.isDelete = false");
		StringBuffer rowsHql = new StringBuffer("from ViewticketOrders  t where  t.isDelete = false");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = Tools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		Tools.setSearchWhere(hqls, pageModel, params);
		//查询记录
		List<ViewticketOrders> beanList = viewOrdersdao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		//所有数据
		List<PageViewOrders> rows = Tools.copyPropertiesList(beanList, PageViewOrders.class);
		Integer total = viewOrdersdao.length(totalHql.toString(),params);
		//给数据设置其他属性
		for(int i = 0;i<rows.size();i++){
			rows.get(i).setUserId(beanList.get(i).getUsers().getId());
			rows.get(i).setTicketId(beanList.get(i).getViewticketTickets().getId());
		}
		//设置JSON属性
		dg.setRows(rows);
		dg.setTotal(total);
		return dg;
	}
	@Override
	public void updateOrdersStatus(PageViewOrders pageModel,Admins onlineAdmin) throws Exception {
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_VIEWTICKET_ORDER);
		ViewticketOrders order = new ViewticketOrders();
		order = viewOrdersdao.findById(ViewticketOrders.class, pageModel.getId());
		
		//直接修改
		order.setStatus(pageModel.getStatus());
		viewOrdersdao.update(order);
	}

}
