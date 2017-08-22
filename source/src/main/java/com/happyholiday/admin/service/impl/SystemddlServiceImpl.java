package com.happyholiday.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import antlr.build.Tool;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.dao.AdminUpdateRecordDaoI;
import com.happyholiday.admin.dao.SystemddlDaoI;
import com.happyholiday.admin.exception.AdminsException;
import com.happyholiday.admin.exception.SystemddlException;
import com.happyholiday.admin.pageModel.PageAdminUpdateRecord;
import com.happyholiday.admin.pageModel.PageMenuTree;
import com.happyholiday.admin.pageModel.PageSystemddl;
import com.happyholiday.admin.service.AdminUpdateRecordServiceI;
import com.happyholiday.admin.service.SystemddlServiceI;
import com.happyholiday.admin.users.pageModel.PageUsers;
import com.happyholiday.admin.util.BackReturnJSON;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.Adminupdaterecord;
import com.happyholiday.model.Menutree;
import com.happyholiday.model.Systemddl;
import com.happyholiday.model.Users;

@Service(value = "systemddlService")
public class SystemddlServiceImpl implements SystemddlServiceI {
	private SystemddlDaoI systemddlDao;

	public SystemddlDaoI getSystemddlDao() {
		return systemddlDao;
	}
	@Autowired
	public void setSystemddlDao(SystemddlDaoI systemddlDao) {
		this.systemddlDao = systemddlDao;
	}
	@Override
	public BackReturnJSON<PageSystemddl> getSystemddlRootDatagrid(Admins onlineAdmin,
			PageSystemddl pageModel) throws Exception {

		/**
		 * 1.判断当前用户是否拥有查询权限
		 * 2.执行
		 * 3.返回结果
		 */
		//验证1003权限（查看字典权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_SYSTEMDDL)){
			throw new AdminsException("您没有查看字典权限！");
		}
		//2.查询
		BackReturnJSON<PageSystemddl> returnJSON = new BackReturnJSON<PageSystemddl>();
		Map<String,Object> params = BackTools.getHashMap();
		//hql语句
		params.put("tname", BackStatic.HQL_TABLE_NAME_SYSTEMDDL);
		StringBuffer totalHql = new StringBuffer("select count(*) from :tname t where 1=1");
		StringBuffer rowsHql = new StringBuffer("from :tname t where 1=1");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = BackTools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		//添加wehre
		BackTools.setSearchWhere(hqls, pageModel, params);
		BackStatic.log.info(rowsHql);
		//如果排序,拼筹hql
		if(pageModel.getSort()!=null&&!pageModel.getSort().trim().equals("")&&pageModel.getOrder()!=null&&!pageModel.getOrder().trim().equals("")){
			rowsHql.append( " order by "+pageModel.getSort()+" "+pageModel.getOrder());
		}
		//查询记录
		List<Systemddl> beanList = systemddlDao.get(rowsHql.toString(),params,pageModel.getPage(),pageModel.getRows());
		
		//转化模型
		List<PageSystemddl> rows = BackTools.copyPropertiesList(beanList, PageSystemddl.class);
	
		//查询total
		Integer total = systemddlDao.length(totalHql.toString(),params);

		returnJSON.setRows(rows);
		returnJSON.setTotal(total);
		//3.返回结果
		return returnJSON;
	}
	
	@Override
	public List<PageSystemddl> getSystemddlByParentId(Admins onlineAdmin,
			String id) throws Exception {
		//验证1003权限（查看字典权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_SYSTEMDDL)){
			throw new AdminsException("您没有查看字典权限！");
		}
		//储存查询到的子节点
		List<Systemddl> childrens = null;
		
		if(id==null||id.equals("")||id.equals("null")){
			//获取根节点
			childrens = systemddlDao.get("from "+BackStatic.HQL_TABLE_NAME_SYSTEMDDL+" t where t.systemddl is null");
		}else{
			/*获取子节点*/
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", id);
			childrens = systemddlDao.get("from "+BackStatic.HQL_TABLE_NAME_SYSTEMDDL+" t where t.systemddl.id = :id",map);
			
		}
		List<PageSystemddl> systemddls = new ArrayList<PageSystemddl>();
		//判断是否有节点
		if(childrens!=null&&!childrens.isEmpty()){
			//遍历节点,设置其开闭状态和url
			for (Systemddl menutree : childrens) {
				PageSystemddl systemddl = new PageSystemddl();
				//获取子节点
				List<Systemddl> list = systemddlDao.get("from "+BackStatic.HQL_TABLE_NAME_SYSTEMDDL+" t where t.systemddl.id=:parentId",BackTools.getHashMap(new String[]{"parentId"}, new Object[]{menutree.getId()}));
				BeanUtils.copyProperties(menutree,systemddl);
				//设置tree节点开闭状态
				if(list!=null&&!list.isEmpty()){
					systemddl.setState("closed");
				}else{

					systemddl.setState("opend");
				}
				//设置url
				Map<String,Object> attributes = new HashMap<String,Object>();
				attributes.put("url", menutree.getUrl());
				//设置parentid
				attributes.put("parentId", id);
				//设置high
				attributes.put("high", menutree.getHigh());
				//设置currthigh
				attributes.put("currtHigh", menutree.getCurrtHigh());
				systemddl.setAttrbutes(attributes);
				//添加节点
				systemddls.add(systemddl);
			}
		}
		return systemddls;
	}
	@Override 
	public PageSystemddl addSystemddl(Admins onlineAdmin, String parentId)
			throws Exception {
		//验证1001权限（添加字典权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_SYSTEMDDL)){
			throw new AdminsException("您没有添加字典权限！");
		}
		//获取指定id的父节点
		Systemddl parentSystemddl = systemddlDao.find("from "+BackStatic.HQL_TABLE_NAME_SYSTEMDDL+" t where t.id = :parentId",BackTools.getHashMap(new String[]{"parentId"}, new Object[]{parentId}));
		Integer high = parentSystemddl.getHigh();
		Integer parentCurrtHigh = parentSystemddl.getCurrtHigh();
		//如果添加固定节点
		if(parentId.equals("root")){
			throw new SystemddlException("不能新建固定节点！");
		}
		//如果超过了规定深度
		if(high<parentCurrtHigh+1){
			throw new SystemddlException("不能新建这层深度的节点！");
		}
		Systemddl newSystemddl = new Systemddl();
		newSystemddl.setCurrtHigh(parentCurrtHigh+1);
		newSystemddl.setHigh(high);
		newSystemddl.setSystemddl(parentSystemddl);
		newSystemddl.setId(UUID.randomUUID().toString());
		newSystemddl.setText("新节点");
		systemddlDao.save(newSystemddl);
		
		//设置返回参数
		PageSystemddl pageModel = new PageSystemddl();
		BeanUtils.copyProperties(newSystemddl, pageModel);
		Map<String,Object> attrbutes = BackTools.getHashMap();
		attrbutes.put("high",newSystemddl.getHigh());
		attrbutes.put("currtHigh",newSystemddl.getCurrtHigh());
		pageModel.setAttrbutes(attrbutes);
		return pageModel;
	}
	@Override
	public void updateSystemddl(Admins onlineAdmin, PageSystemddl pageModel)
			throws Exception {
		//验证1004权限（修改字典权限）
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_SYSTEMDDL)){
			throw new AdminsException("您没有修改字典权限！");
		}
		//获取指定id的节点
		Systemddl systemddl = systemddlDao.find("from "+BackStatic.HQL_TABLE_NAME_SYSTEMDDL+" t where t.id = :id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageModel.getId()}));
		//说明此id的节点为root节点
		if(systemddl==null){
			throw new SystemddlException("该节点不存在！");
		}
		if(systemddl.getSystemddl()==null){
			throw new SystemddlException("不能更新根节点！");
		}
		 
		if(systemddl.getSystemddl().getId().equals("root")){
			throw new SystemddlException("不能更新固定节点！");
		}
		
		systemddl.setText(pageModel.getText());
		systemddlDao.update(systemddl);
	}
	@Override  
	public void deleteSystemddl(Admins onlineAdmin, PageSystemddl pageModel) throws Exception {
		//验证1002权限（删除字典权限） 
		if(!BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_SYSTEMDDL)){
			throw new AdminsException("您没有删除字典权限！");
		} 
		Systemddl systemddl = systemddlDao.find("from "+BackStatic.HQL_TABLE_NAME_SYSTEMDDL+" t where t.id = :id",BackTools.getHashMap(new String[]{"id"}, new Object[]{pageModel.getId()}));
		if(systemddl==null){
			throw new SystemddlException("该节点不存在！");
		}
		systemddlDao.delete(systemddl);
	}
	
	
	
}
