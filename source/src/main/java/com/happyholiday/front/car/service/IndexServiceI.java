package com.happyholiday.front.car.service;

import java.util.List;

import com.happyholiday.pagemodel.PageIndex;

public interface IndexServiceI {
	 List<PageIndex> getCarouselsImg(PageIndex pageIndex) throws Exception;
}
