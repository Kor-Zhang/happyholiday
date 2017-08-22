package com.happyholiday.front.viewstickets.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.viewstickets.dao.ViewCarouselsDaoI;
import com.happyholiday.front.viewstickets.pageModel.PageViewCarousels;
import com.happyholiday.front.viewstickets.service.ViewCarouselsServiceI;
import com.happyholiday.front.viewstickets.util.Tools;
import com.happyholiday.model.ViewticketCarousels;

@Service("frontViewCarouselservice")
public class ViewCarouselsServiceImpl implements ViewCarouselsServiceI {
		
	//配置dao
	private ViewCarouselsDaoI frontViewCarouselsdao;

	public ViewCarouselsDaoI getFrontViewCarouselsdao() {
		return frontViewCarouselsdao;
	}
	@Autowired
	public void setFrontViewCarouselsdao(ViewCarouselsDaoI frontViewCarouselsdao) {
		this.frontViewCarouselsdao = frontViewCarouselsdao;
	}
	@Override
	public List<PageViewCarousels> getCarouselsImg(PageViewCarousels pageModel)
			throws Exception {
		// TODO 自动生成的方法存根
		List<ViewticketCarousels> list  = frontViewCarouselsdao.get("from ViewticketCarousels where 1=1");
		List<PageViewCarousels>  pl =  Tools.copyPropertiesList(list, PageViewCarousels.class);
		int index = 0;
		for (PageViewCarousels pvc : pl) {
			pvc.setImgName(list.get(index).getImgs().getImgName());
			index ++;
		}
		
		return pl;
	}
	
}
