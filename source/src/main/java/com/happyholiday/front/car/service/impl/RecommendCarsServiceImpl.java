package com.happyholiday.front.car.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.car.dao.RecommendCarsDaoI;
import com.happyholiday.front.car.pageModel.PageRecommendCars;
import com.happyholiday.front.car.service.RecommendCarsServiceI;
import com.happyholiday.front.car.util.Tools;
import com.happyholiday.model.Carimgs;
import com.happyholiday.model.Recommendcars;
@Service(value = "frontRcmdCarService")
public class RecommendCarsServiceImpl  implements RecommendCarsServiceI{
	
	//配置DAO
	
	private RecommendCarsDaoI frontRcmdCarDao;
	
	public RecommendCarsDaoI getFrontRcmdCarDao() {
		return frontRcmdCarDao;
	}
	@Autowired
	public void setFrontRcmdCarDao(RecommendCarsDaoI frontRcmdCarDao) {
		this.frontRcmdCarDao = frontRcmdCarDao;
	}

	@Override
	public List<PageRecommendCars> getInfo(PageRecommendCars pageRecommendCars)
			throws Exception {
		// TODO 自动生成的方法存根
		List<Recommendcars> rc = new ArrayList<Recommendcars>();
		String hql  ="from Recommendcars where 1 = 1";
		rc = frontRcmdCarDao.get(hql);
		List<PageRecommendCars> prc = Tools.copyPropertiesList(rc, PageRecommendCars.class);
		int i =0;
		for (PageRecommendCars page : prc) {
			page.setCarBd(rc.get(i).getCars().getCarBd());
			page.setPrice(rc.get(i).getCars().getPrice());
			page.setCarId(rc.get(i).getCars().getId());
			Set<Carimgs> carImgs =  rc.get(i).getCars().getCarimgses();
			for (Carimgs ci : carImgs) {
				if(ci.getMain()){
					page.setMainImgName(ci.getImgs().getImgName());
				}
			}
			i++;
		}
		return prc;
	}

}
