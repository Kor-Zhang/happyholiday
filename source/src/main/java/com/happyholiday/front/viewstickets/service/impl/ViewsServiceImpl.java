package com.happyholiday.front.viewstickets.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;







import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.viewstickets.dao.ViewsDaoI;
import com.happyholiday.front.viewstickets.pageModel.PageViewIntro;
import com.happyholiday.front.viewstickets.pageModel.PageViewTickets;
import com.happyholiday.front.viewstickets.pageModel.PageViews;
import com.happyholiday.front.viewstickets.service.ViewsServiceI;
import com.happyholiday.front.viewstickets.util.ReturnJSON;
import com.happyholiday.front.viewstickets.util.Tools;
import com.happyholiday.model.ViewticketTickets;
import com.happyholiday.model.ViewticketViews;
import com.happyholiday.model.ViewticketViewsImgs;
import com.happyholiday.model.ViewticketViewsIntroductions;

@Service("frontViewservice")
public class ViewsServiceImpl implements ViewsServiceI {
	// 配置dao
	private ViewsDaoI frontViewsdao;
	

	public ViewsDaoI getFrontViewsdao() {
		return frontViewsdao;
	}
	@Autowired
	public void setFrontViewsdao(ViewsDaoI frontViewsdao) {
		this.frontViewsdao = frontViewsdao;
	}

	@Override
	public ReturnJSON<PageViews> getViewsInfo(PageViews pageModel)
			throws Exception {
		// TODO 自动生成的方法存根
		// 设置返回值
		ReturnJSON<PageViews> retJSON = new ReturnJSON<PageViews>();
		// 基本hql 查询未删除 且带有景区介绍的景点
		String hql = "from ViewticketViews where 1 = 1 and isDelete = false and hasIntro = true";
		hql = checkSearch(pageModel, hql);  //筛选条件
		List<ViewticketViews> sourceList = frontViewsdao.get(hql);
		List<PageViews> allList = Tools.copyPropertiesList(sourceList,
				PageViews.class);
		
		System.out.println("allList.size:"+allList.size());
		// 景区主要图片名字
		// 设置rows的图片
		for (int i = 0; i < allList.size(); i++) {
			Set<ViewticketViewsImgs> imgs = sourceList.get(i)
					.getViewticketViewsImgses();
			for (ViewticketViewsImgs vi : imgs) {
				if (vi.getMain() == true) {
					allList.get(i).setImgName(vi.getImgs().getImgName());
				} 
			}
		}
		// 设置rows的最低价格
		for (int i = 0; i < allList.size(); i++) {
			Set<ViewticketTickets> tickets = sourceList.get(i)
					.getViewticketTicketses();
			List<Integer> prices = new ArrayList<Integer>();
			List<Integer> marketPrice = new ArrayList<Integer>();
			for (ViewticketTickets vt : tickets) {
				prices.add(vt.getHappyPrice());
				marketPrice.add(vt.getMarketPrice());
			}
			Collections.sort(prices);
			Collections.sort(marketPrice);
			allList.get(i).setMarketPrice(marketPrice.get(0));
			allList.get(i).setLowPrice(prices.get(0));
		}
		/**  筛选完后  进行排序**/
		//按人气
		if(pageModel.getSort()!=null&&pageModel.getSort().equals("人气")){
			sortViewListByrenqi(allList);
		}
		//按价格
		if(pageModel.getSort()!=null&&pageModel.getSort().equals("价格从高到低")){
			sortViewListByPricehigh(allList);
		}
		if(pageModel.getSort()!=null&&pageModel.getSort().equals("价格从低到高")){
			sortViewListByPricelow(allList);
		}
		
		/****直接分页****/
		List<PageViews> rows = kkpager(allList, pageModel.getPage(), pageModel.getRows());
		// 设置返回值
		retJSON.setTotal(allList.size());
		retJSON.setRows(rows);
		System.out.println(retJSON.toString());
		return retJSON;
	}

	public String checkSearch(PageViews pageModel, String hql) {
		//搜索条件
		if(pageModel.getKeyword()!=""&&pageModel.getKeyword()!=null){
			hql = hql +" and (name like '%"+pageModel.getKeyword()+"%' or address like '%"+pageModel.getKeyword()+"%')";
			/*hql = hql +" or address like '%"+pageModel.getKeyword()+"%'";*/
		}
		// 查询某个省的景区
		if (pageModel.getProvince() != "" && pageModel.getProvince() != null) {
			hql = hql + " and  province = '" + pageModel.getProvince() + "'";
		}
		//按景区主题查找
		if (pageModel.getType()!= null&&pageModel.getType()!="") {
			if(!pageModel.getType().equals("不限") ){
				hql = hql + " and  type = '" + pageModel.getType() + "'";								
			}
		}
		return hql;
	}

	@Override
	public PageViews getOneView(PageViews pageModel) throws Exception {
		// TODO 自动生成的方法存根
		//根据ID 查找景区
		ViewticketViews view = frontViewsdao.find("from ViewticketViews where id ='"+pageModel.getId()+"'");
		
		//赋值给pageView
		PageViews row = new PageViews();
		BeanUtils.copyProperties(view, row);
		
		//查找景区所有的 门票
		Set<ViewticketTickets>  tickets = view.getViewticketTicketses();
		//赋值门票信息
		List<ViewticketTickets> beanList = new ArrayList<ViewticketTickets>();
		//赋值最低价格
		List<Integer> lowPrice = new ArrayList<Integer>();
		for (ViewticketTickets vt : tickets) {
			beanList.add(vt);
			lowPrice.add(vt.getHappyPrice());
		}
		List<PageViewTickets> targetList = Tools.copyPropertiesList(beanList, PageViewTickets.class);
		for (PageViewTickets pt : targetList) {
			pt.setViewId(pageModel.getId());
			pt.setViewName(view.getName());
		}
		row.setViewticket(targetList);
		
		//赋值图片
		Set<ViewticketViewsImgs> imgs = view.getViewticketViewsImgses();
		List<String> imgsName = new ArrayList<String>();
		for (ViewticketViewsImgs vtt : imgs) {
			imgsName.add(vtt.getImgs().getImgName());
		}
		row.setImgsName(imgsName);
		

		//最低价格
		Collections.sort(lowPrice);
		row.setLowPrice(lowPrice.get(0));
		
		//设置景区介绍
		Set<ViewticketViewsIntroductions> intro = view.getViewticketViewsIntroductionses();
		List<ViewticketViewsIntroductions> viewsourceList = new ArrayList<ViewticketViewsIntroductions>();
		for (ViewticketViewsIntroductions vvi : intro) {
			viewsourceList.add(vvi);
		}
		List<PageViewIntro> viewIntro = Tools.copyPropertiesList(viewsourceList, PageViewIntro.class);
		row.setViewIntro(viewIntro);
		return row;
	}
	
	/**
	 * 按照人气进行排序
	 * @param data
	 */
	public void sortViewListByrenqi(List<PageViews> data){
		Collections.sort(data,  new Comparator<PageViews>() {

			@Override
			public int compare(PageViews o1, PageViews o2) {
				// TODO 自动生成的方法存根
				Integer  a  =(Integer) o1.getSalesNumber();
				Integer  b  =(Integer) o2.getSalesNumber();
				/*//升序
				return a.compareTo(b);*/
				//降序
				return b.compareTo(a);
			}
			
		});
	}
	
	/**
	 * 价格从高到低
	 * @param data
	 */
	public void sortViewListByPricehigh(List<PageViews> data){
		Collections.sort(data,  new Comparator<PageViews>() {
	
			@Override
			public int compare(PageViews o1, PageViews o2) {
				// TODO 自动生成的方法存根
				Integer  a  =(Integer) o1.getLowPrice();
				Integer  b  =(Integer) o2.getLowPrice();
				/*//升序
				return a.compareTo(b);*/
				//降序
				return b.compareTo(a);
			}
		});
	}
	/**
	 * 价格从低到高
	 * @param data
	 */
	public void sortViewListByPricelow(List<PageViews> data){
		Collections.sort(data,  new Comparator<PageViews>() {
	
			@Override
			public int compare(PageViews o1, PageViews o2) {
				// TODO 自动生成的方法存根
				Integer  a  =(Integer) o1.getLowPrice();
				Integer  b  =(Integer) o2.getLowPrice();
				//升序
				return a.compareTo(b);
				/*//降序
				return b.compareTo(a);*/
			}
		});
	}
	/**
	 * 取出 10个对象 存入rows
	 * @param allList  全部景区
	 * @param page  第几页
	 * @param rows  一页几个 默认10个
	 * @return  返回10个景区对象的list集合
	 */
	public List<PageViews> kkpager(List<PageViews> allList, Integer page, Integer rows){
		Integer index = (page-1)*10;
		Integer end = index +rows-1;
		Integer size = allList.size();  //获取全部的大小
		System.out.println("size"+size);
		if(end>size){   //如果越界 则赋值size  例如 size 18 那么肯定取不到19
			end = size;
		} 
		List<PageViews> list = new ArrayList<PageViews>();
		for(int i=index;i<end;i++){
			list.add(allList.get(i));
		}
		return list;
	}
	
	/**
	 * 每个省的景区top10
	 */
	@Override
	public ReturnJSON<PageViews> getTop10(PageViews pageModel) throws Exception {
		// TODO 自动生成的方法存根
		// 设置返回值
		ReturnJSON<PageViews> retJSON = new ReturnJSON<PageViews>();
		// 基本hql 查询未删除 且带有景区介绍的景点
		String hql = "from ViewticketViews where 1 = 1 and isDelete = false and hasIntro = true";
		List<ViewticketViews> sourceList = frontViewsdao.get(hql);
		List<PageViews> allList = Tools.copyPropertiesList(sourceList,
				PageViews.class);
		// 景区主要图片名字
		// 设置rows的图片
		for (int i = 0; i < allList.size(); i++) {
			Set<ViewticketViewsImgs> imgs = sourceList.get(i)
					.getViewticketViewsImgses();
			for (ViewticketViewsImgs vi : imgs) {
				if (vi.getMain() == true) {
					allList.get(i).setImgName(vi.getImgs().getImgName());
				} 
			}
		}
		/**
		 * 获取top10
		 */
		sortViewListByrenqi(allList);
		List<PageViews> rows = kkpager(allList, 1, 10);
		// 设置返回值
		retJSON.setTotal(allList.size());
		retJSON.setRows(rows);
		return retJSON;
	}
}
