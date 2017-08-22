package com.happyholiday.front.car.service;

import java.util.List;

import com.happyholiday.front.car.pageModel.PageCars;
import com.happyholiday.model.Cars;

public interface CarsServiceI {
	List<PageCars> selectInfo(PageCars pageCar) throws Exception;
	int selectInfoSize(PageCars pageCar) throws Exception;
	PageCars selectCarInfo(PageCars pageCar) throws Exception;
}
