package com.happyholiday.admin.viewstickets.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.viewstickets.dao.ViewIntrosDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewsDaoI;
import com.happyholiday.admin.viewstickets.pageModel.PageViewIntros;
import com.happyholiday.admin.viewstickets.service.ViewIntrosServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.ViewticketViews;
import com.happyholiday.model.ViewticketViewsIntroductions;
@Service(value="viewIntrosService")
public class ViewIntrosServiceImpl implements ViewIntrosServiceI{
		//配置Dao
		private ViewsDaoI viewsdao;
		public ViewsDaoI getViewsdao() {
			return viewsdao;
		}
		@Autowired
		public void setViewsdao(ViewsDaoI viewsdao) {
			this.viewsdao = viewsdao;
		}
		private ViewIntrosDaoI viewIntrosdao;
		public ViewIntrosDaoI getViewIntrosdao() {
			return viewIntrosdao;
		}
		@Autowired
		public void setViewIntrosdao(ViewIntrosDaoI viewIntrosdao) {
			this.viewIntrosdao = viewIntrosdao;
		}
		@Override
		public ReturnJSON<PageViewIntros> getViewIntrosDatagrid(
				PageViewIntros pageModel,Admins onlineAdmin) throws Exception {
			// 验证权限
			BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_INTRO);
			//查询
			ReturnJSON< PageViewIntros> dg = new ReturnJSON<>();
			
			
			//hql语句
			String rowsHql = "from ViewticketViewsIntroductions  t where  t.isDelete = false";
			String totalHql = "from ViewticketViewsIntroductions t where  t.isDelete = false";
			if(pageModel.getSearchViewName()!=""&&pageModel.getSearchViewName()!=null){
				//如果不为空 
				/**
				 *  先从view表里面查找出Id 在根据外键来查找intro
				 */
				List<ViewticketViews> viewList = viewsdao.get("from ViewticketViews where isDelete  = false  and hasIntro = true and name like '%"+pageModel.getSearchViewName()+"%'");
				System.out.println("viewList:"+viewList.size()+"viewList");
				List<ViewticketViewsIntroductions> beanList  = new ArrayList<ViewticketViewsIntroductions>();
				for(int i =0;i<viewList.size();i++){
					beanList.add(i, viewIntrosdao.find("from ViewticketViewsIntroductions where isDelete = false and viewId = '"+viewList.get(i).getId()+"'"));
				}
				 List<PageViewIntros> rows = Tools.copyPropertiesList(beanList, PageViewIntros.class);
			    for(int i=0;i<beanList.size();i++){
			    	rows.get(i).setViewId(beanList.get(i).getViewticketViews().getId());
			    	rows.get(i).setViewName(beanList.get(i).getViewticketViews().getName());
			    }
				//设置JSON属性
				dg.setRows(rows);
				dg.setTotal(rows.size());
				return dg;
				
			}else{
				
				List<ViewticketViewsIntroductions> beanList = viewIntrosdao.get(rowsHql,pageModel.getPage(),pageModel.getRows());
				List<ViewticketViewsIntroductions> totalList = viewIntrosdao.get(totalHql);
				List<PageViewIntros> rows = Tools.copyPropertiesList(beanList, PageViewIntros.class);
				for(int i=0;i<beanList.size();i++){
					rows.get(i).setViewId(beanList.get(i).getViewticketViews().getId());
					rows.get(i).setViewName(beanList.get(i).getViewticketViews().getName());
				}
				
				//设置JSON属性
				dg.setRows(rows);
				dg.setTotal(totalList.size());
				return dg;
				
			}
		}
		@Override
		public void addViewIntro(PageViewIntros pageModel,Admins onlineAdmin) throws Exception {
			// 验证权限
			BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_ADD_VIEW_INTRO);
			//先判断参数是否为空
			if(pageModel.getViewName()==null){
				throw new Exception("该区域没有景区！！请先添加景区");
			}
			if(pageModel.getIntroduction().trim().length()==0){
				throw new Exception("请填写景区详情1");
			}
			if(pageModel.getTextDescription().trim().length()==0){
				throw new Exception("请填写特色简介1");
			}
			//获取景区名 查找景区
			String viewName = pageModel.getViewName();
			ViewticketViews view = viewsdao.find("from ViewticketViews where isDelete = false and name ='"+viewName+"'");
			view.setHasIntro(true);
			//赋值给viewIntros
			ViewticketViewsIntroductions viewIntro = new ViewticketViewsIntroductions();
			BeanUtils.copyProperties(pageModel, viewIntro);
			viewIntro.setViewticketViews(view);
			viewIntro.setId(UUID.randomUUID().toString());
			viewIntro.setIsDelete(false);
			viewIntro.setCreateTime(new Timestamp(new Date().getTime()));
			//写入数据库
			viewIntrosdao.save(viewIntro);
		}
		@Override
		public void deleteViewIntro(PageViewIntros pageModel,Admins onlineAdmin) throws Exception {
			// 验证权限
			BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_DELETE_VIEW_INTRO);
	
			ViewticketViewsIntroductions viewIntro = viewIntrosdao.find("from ViewticketViewsIntroductions where id='"+pageModel.getId()+"'");
			viewIntro.getViewticketViews().setHasIntro(false);
			viewIntro.setIsDelete(true);
			viewIntrosdao.save(viewIntro);
		}
		@Override
		public void updateViewIntro(PageViewIntros pageModel,Admins onlineAdmin) throws Exception {
			// 验证权限
			BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_UPDATE_VIEW_INTRO);
			if(pageModel.getIntroduction().trim().length()==0){
				throw new Exception("请填写景区详情1");
			}
			if(pageModel.getTextDescription().trim().length()==0){
				throw new Exception("请填写特色简介1");
			}
			ViewticketViewsIntroductions viewIntro = viewIntrosdao.find("from ViewticketViewsIntroductions where id='"+pageModel.getId()+"'");
			//设置修改值
			viewIntro.setIntroduction(pageModel.getIntroduction());
			viewIntro.setIntroductionTwo(pageModel.getIntroductionTwo());
			viewIntro.setIntroductionThree(pageModel.getIntroductionThree());
			viewIntro.setTextDescription(pageModel.getTextDescription());
			viewIntro.setTextDescriptionThree(pageModel.getTextDescriptionThree());
			viewIntro.setTextDescriptionTwo(pageModel.getTextDescriptionTwo());
			viewIntro.setCreateTime(new Timestamp(new Date().getTime()));
			viewIntrosdao.update(viewIntro);
		}
		
		
		
}
