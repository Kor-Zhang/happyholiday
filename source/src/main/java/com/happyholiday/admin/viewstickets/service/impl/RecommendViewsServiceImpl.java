package com.happyholiday.admin.viewstickets.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.admin.BackStatic;
import com.happyholiday.admin.util.BackTools;
import com.happyholiday.admin.viewstickets.dao.RecommendViewsDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewsDaoI;
import com.happyholiday.admin.viewstickets.dao.ViewsImgsDaoI;
import com.happyholiday.admin.viewstickets.pageModel.PageRecommendViews;
import com.happyholiday.admin.viewstickets.service.RecommendViewsServiceI;
import com.happyholiday.admin.viewstickets.util.ReturnJSON;
import com.happyholiday.admin.viewstickets.util.Tools;
import com.happyholiday.model.Admins;
import com.happyholiday.model.ViewticketRecommendviews;
import com.happyholiday.model.ViewticketViews;
import com.happyholiday.model.ViewticketViewsImgs;
@Service(value="recommendViewsService")
public class RecommendViewsServiceImpl implements RecommendViewsServiceI{
	//配置recommendViewsdao
	private RecommendViewsDaoI recommendViewsdao;
	
	public RecommendViewsDaoI getRecommendViewsdao() {
		return recommendViewsdao;
	}
	@Autowired
	public void setRecommendViewsdao(RecommendViewsDaoI recommendViewsdao) {
		this.recommendViewsdao = recommendViewsdao;
	}
	
	//配置viewsDao
	private ViewsDaoI  viewsdao ;
	
	public ViewsDaoI getViewsdao() {
		return viewsdao;
	}
	@Autowired
	public void setViewsdao(ViewsDaoI viewsdao) {
		this.viewsdao = viewsdao;
	}
	
	//配置viewsImgsDao
	private ViewsImgsDaoI viewsImgsdao;
	public ViewsImgsDaoI getViewsImgsdao() {
		return viewsImgsdao;
	}
	@Autowired
	public void setViewsImgsdao(ViewsImgsDaoI viewsImgsdao) {
		this.viewsImgsdao = viewsImgsdao;
	}
	
	@Override
	public ReturnJSON<PageRecommendViews> getDatagrid(Admins onlineAdmin,
			PageRecommendViews pageModel) throws Exception {
		// TODO Auto-generated method stub
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
		//查询所有
		ReturnJSON<PageRecommendViews> dg = new ReturnJSON<>();
		//hql语句
		StringBuffer totalHql = new StringBuffer("select count(*) from ViewticketRecommendviews  where  1 = 1");
		StringBuffer rowsHql = new StringBuffer("from ViewticketRecommendviews   where 1 = 1");
		//设置where条件
		//list储存需要添加where条件的hql语句
		List<StringBuffer> hqls = Tools.getArrayList();
		//设置需要添加where的语句
		hqls.add(totalHql);
		hqls.add(rowsHql);
		
		//查询记录
		List<ViewticketRecommendviews> sourceList = recommendViewsdao.get(rowsHql.toString(),  pageModel.getPage(), pageModel.getRows());
		List<PageRecommendViews> rows = Tools.copyPropertiesList(sourceList, PageRecommendViews.class);
		
		//配置 imgName 和  viewId
		for(int i = 0;i<sourceList.size();i++){
			rows.get(i).setViewId(sourceList.get(i).getViewticketViews().getId());
			Set<ViewticketViewsImgs> viewImgs = sourceList.get(i).getViewticketViews().getViewticketViewsImgses();
			for (ViewticketViewsImgs vvi : viewImgs) {
				if(vvi.getMain()==true){
					String imgName = vvi.getImgs().getImgName();
					rows.get(i).setImgName(imgName);
				}
			}
			
		}
		
		//查询total
		Integer total = recommendViewsdao.length(totalHql.toString());
		//设置JSON属性
		dg.setRows(rows);
		dg.setTotal(total);
		return dg;
	}

	@Override
	public void addRecommendView(Admins onlineAdmin,
			PageRecommendViews pageModel) throws Exception {
		// TODO Auto-generated method stub
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
		//查询是否存在该景区的推荐
		System.out.println("viewId:"+pageModel.getViewId());
		ViewticketRecommendviews vrv =  recommendViewsdao.find("from ViewticketRecommendviews  where viewId = '"+pageModel.getViewId()+"'");
		System.out.println("vrv:"+vrv);
		if(null != vrv){
			throw new Exception("该景区已经被推荐！");
		}
		vrv = new ViewticketRecommendviews();
		ViewticketViews view = new ViewticketViews();
		view.setId(pageModel.getViewId());
		vrv.setViewticketViews(view);
		vrv.setCreateTime(new Timestamp(new Date().getTime()));
		vrv.setId(UUID.randomUUID().toString());
		vrv.setIntroduction("");
		recommendViewsdao.save(vrv);
	}

	@Override
	public void deleteRecommendView(Admins onlineAdmin,
			PageRecommendViews pageModel) throws Exception {
		// TODO Auto-generated method stub
		// 验证权限
		BackTools.power(onlineAdmin.getId(),BackStatic.POWER_ID_QUERY_VIEW_LIST);
		ViewticketRecommendviews vrv = new ViewticketRecommendviews();
		vrv.setId(pageModel.getDeleteIds());
		recommendViewsdao.delete(vrv);
		
	}

}
