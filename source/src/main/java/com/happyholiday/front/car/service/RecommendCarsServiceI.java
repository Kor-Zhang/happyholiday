package com.happyholiday.front.car.service;

import java.util.List;

import com.happyholiday.front.car.pageModel.PageRecommendCars;

public interface RecommendCarsServiceI {
		List<PageRecommendCars> getInfo(PageRecommendCars pageRecommendCars) throws Exception; 
}
