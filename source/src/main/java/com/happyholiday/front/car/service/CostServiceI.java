package com.happyholiday.front.car.service;

import java.util.List;

import com.happyholiday.front.car.pageModel.PageCost;

public interface CostServiceI {
	/**
	 * 获取 Cost表的数据
	 * @return
	 * @throws Exception
	 */
		List<PageCost> getCostInfo() throws Exception;
}
