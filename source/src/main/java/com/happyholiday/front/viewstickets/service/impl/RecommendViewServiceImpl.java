package com.happyholiday.front.viewstickets.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.viewstickets.dao.RecommendViewDaoI;
import com.happyholiday.front.viewstickets.pageModel.PageRecommendView;
import com.happyholiday.front.viewstickets.service.RecommendViewServiceI;
import com.happyholiday.front.viewstickets.util.ReturnJSON;
import com.happyholiday.front.viewstickets.util.Tools;
import com.happyholiday.model.ViewticketRecommendviews;
import com.happyholiday.model.ViewticketTickets;
import com.happyholiday.model.ViewticketViewsImgs;
@Service("frontRecommendViewservice")
public class RecommendViewServiceImpl implements RecommendViewServiceI{
	private RecommendViewDaoI frontRecommendViewdao;
	
	public RecommendViewDaoI getFrontRecommendViewdao() {
		return frontRecommendViewdao;
	}
	@Autowired
	public void setFrontRecommendViewdao(RecommendViewDaoI frontRecommendViewdao) {
		this.frontRecommendViewdao = frontRecommendViewdao;
	}
	
	@Override
	public ReturnJSON<PageRecommendView> getData(PageRecommendView pageModel)
			throws Exception {
		// TODO Auto-generated method stub
		ReturnJSON<PageRecommendView> retJSON = new ReturnJSON<>();
		List<ViewticketRecommendviews> sourceList = frontRecommendViewdao.get("from ViewticketRecommendviews where 1=1");
		List<PageRecommendView> rows = Tools.copyPropertiesList(sourceList, PageRecommendView.class);
		//设置其他值
		for(int i = 0;i<sourceList.size();i++){
			rows.get(i).setViewId(sourceList.get(i).getViewticketViews().getId());
			rows.get(i).setViewName(sourceList.get(i).getViewticketViews().getName());
			
			Set<ViewticketViewsImgs> viewImgs = sourceList.get(i).getViewticketViews().getViewticketViewsImgses();
			for (ViewticketViewsImgs vvi : viewImgs) {
				if(vvi.getMain()==true){
					String imgName = vvi.getImgs().getImgName();
					rows.get(i).setImgName(imgName);
				}
			}
			
			Set<ViewticketTickets> tickets = sourceList.get(i).getViewticketViews().getViewticketTicketses();
			List<Integer> prices = new ArrayList<Integer>();
			for (ViewticketTickets vt : tickets) {
				prices.add(vt.getHappyPrice());
			}
			Collections.sort(prices);
			rows.get(i).setViewPrice(prices.get(0));
		}
		retJSON.setRows(rows);
		retJSON.setTotal(rows.size());
		return retJSON;
	}

}
