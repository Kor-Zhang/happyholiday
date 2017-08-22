package com.happyholiday.admin.cars.pageModel;

import java.sql.Timestamp;

import com.happyholiday.model.Cars;
import com.happyholiday.model.Rentcarusers;
import com.happyholiday.model.Users;
import com.happyholiday.pagemodel.BaseReceivePage;

public class PageOrders  extends BaseReceivePage{
/*	private Cars cars;
	private Users users;
*/
	
	

	private String id;
	private String carId;
	private String rentCarUersId;
	private String userId;
	private Timestamp submitTime;
	private String getCarAddress;
	private String returnCarAddress;
	private Timestamp getCarTime;
	private Timestamp returnCarTime;
	private Integer status;
	private Timestamp realGetCarTime;
	private Timestamp realReturnCarTime;
	private String realGetCarAddress;
	private String realReturnCarAddress;
	private Double totalPrice;
	private Boolean isDelete;
	private String userNote;
	private String adminNote;
	private Double carPrice;
	private Integer rentDayNumber;
	/*****************搜索字段************************/
	private Timestamp searchSubmitTime;
	private String searchGetCarAddress;
	private String searchReturnCarAddress;
	private Integer searchStatus;
	private String searchRealGetCarAddress;
	private String searchRealReturnCarAddress;
	private Boolean searchSsDelete;
	private String searchUserNote;
	private String searchAdminNote;
	

	private Double minTotalPrice;
	private Double maxTotalPrice;
	private Timestamp minGetCarTime;
	private Timestamp maxGetCarTime;
	private Timestamp minReturnCarTime;
	private Timestamp maxReturnCarTime;
	private Timestamp minRealGetCarTime;
	private Timestamp maxRealGetCarTime;
	private Timestamp minRealReturnCarTime;
	private Timestamp maxRealReturnCarTime;
	
	private Integer minRentDayNumber;
	private Integer maxRentDayNumber;
	private Double minCarPrice;
	private Double maxCarPrice;
	
	public Double getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(Double carPrice) {
		this.carPrice = carPrice;
	}
	public Integer getRentDayNumber() {
		return rentDayNumber;
	}
	public void setRentDayNumber(Integer rentDayNumber) {
		this.rentDayNumber = rentDayNumber;
	}
	
	public Integer getMinRentDayNumber() {
		return minRentDayNumber;
	}
	public void setMinRentDayNumber(Integer minRentDayNumber) {
		this.minRentDayNumber = minRentDayNumber;
	}
	public Integer getMaxRentDayNumber() {
		return maxRentDayNumber;
	}
	public void setMaxRentDayNumber(Integer maxRentDayNumber) {
		this.maxRentDayNumber = maxRentDayNumber;
	}
	public Double getMinCarPrice() {
		return minCarPrice;
	}
	public void setMinCarPrice(Double minCarPrice) {
		this.minCarPrice = minCarPrice;
	}
	public Double getMaxCarPrice() {
		return maxCarPrice;
	}
	public void setMaxCarPrice(Double maxCarPrice) {
		this.maxCarPrice = maxCarPrice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getRentCarUersId() {
		return rentCarUersId;
	}
	public void setRentCarUersId(String rentCarUersId) {
		this.rentCarUersId = rentCarUersId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Timestamp submitTime) {
		this.submitTime = submitTime;
	}
	public String getGetCarAddress() {
		return getCarAddress;
	}
	public void setGetCarAddress(String getCarAddress) {
		this.getCarAddress = getCarAddress;
	}
	public String getReturnCarAddress() {
		return returnCarAddress;
	}
	public void setReturnCarAddress(String returnCarAddress) {
		this.returnCarAddress = returnCarAddress;
	}
	public Timestamp getGetCarTime() {
		return getCarTime;
	}
	public void setGetCarTime(Timestamp getCarTime) {
		this.getCarTime = getCarTime;
	}
	public Timestamp getReturnCarTime() {
		return returnCarTime;
	}
	public void setReturnCarTime(Timestamp returnCarTime) {
		this.returnCarTime = returnCarTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Timestamp getRealGetCarTime() {
		return realGetCarTime;
	}
	public void setRealGetCarTime(Timestamp realGetCarTime) {
		this.realGetCarTime = realGetCarTime;
	}
	public Timestamp getRealReturnCarTime() {
		return realReturnCarTime;
	}
	public void setRealReturnCarTime(Timestamp realReturnCarTime) {
		this.realReturnCarTime = realReturnCarTime;
	}
	public String getRealGetCarAddress() {
		return realGetCarAddress;
	}
	public void setRealGetCarAddress(String realGetCarAddress) {
		this.realGetCarAddress = realGetCarAddress;
	}
	public String getRealReturnCarAddress() {
		return realReturnCarAddress;
	}
	public void setRealReturnCarAddress(String realReturnCarAddress) {
		this.realReturnCarAddress = realReturnCarAddress;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public String getUserNote() {
		return userNote;
	}
	public void setUserNote(String userNote) {
		this.userNote = userNote;
	}
	public String getAdminNote() {
		return adminNote;
	}
	public void setAdminNote(String adminNote) {
		this.adminNote = adminNote;
	}
	public Timestamp getSearchSubmitTime() {
		return searchSubmitTime;
	}
	public void setSearchSubmitTime(Timestamp searchSubmitTime) {
		this.searchSubmitTime = searchSubmitTime;
	}
	public String getSearchGetCarAddress() {
		return searchGetCarAddress;
	}
	public void setSearchGetCarAddress(String searchGetCarAddress) {
		this.searchGetCarAddress = searchGetCarAddress;
	}
	public String getSearchReturnCarAddress() {
		return searchReturnCarAddress;
	}
	public void setSearchReturnCarAddress(String searchReturnCarAddress) {
		this.searchReturnCarAddress = searchReturnCarAddress;
	}
	public Integer getSearchStatus() {
		return searchStatus;
	}
	public void setSearchStatus(Integer searchStatus) {
		this.searchStatus = searchStatus;
	}
	public String getSearchRealGetCarAddress() {
		return searchRealGetCarAddress;
	}
	public void setSearchRealGetCarAddress(String searchRealGetCarAddress) {
		this.searchRealGetCarAddress = searchRealGetCarAddress;
	}
	public String getSearchRealReturnCarAddress() {
		return searchRealReturnCarAddress;
	}
	public void setSearchRealReturnCarAddress(String searchRealReturnCarAddress) {
		this.searchRealReturnCarAddress = searchRealReturnCarAddress;
	}
	
	public Double getMinTotalPrice() {
		return minTotalPrice;
	}
	public void setMinTotalPrice(Double minTotalPrice) {
		this.minTotalPrice = minTotalPrice;
	}
	public Double getMaxTotalPrice() {
		return maxTotalPrice;
	}
	public void setMaxTotalPrice(Double maxTotalPrice) {
		this.maxTotalPrice = maxTotalPrice;
	}
	public Boolean getSearchSsDelete() {
		return searchSsDelete;
	}
	public void setSearchSsDelete(Boolean searchSsDelete) {
		this.searchSsDelete = searchSsDelete;
	}
	public String getSearchUserNote() {
		return searchUserNote;
	}
	public void setSearchUserNote(String searchUserNote) {
		this.searchUserNote = searchUserNote;
	}
	public String getSearchAdminNote() {
		return searchAdminNote;
	}
	public void setSearchAdminNote(String searchAdminNote) {
		this.searchAdminNote = searchAdminNote;
	}
	public Timestamp getMinGetCarTime() {
		return minGetCarTime;
	}
	public void setMinGetCarTime(Timestamp minGetCarTime) {
		this.minGetCarTime = minGetCarTime;
	}
	public Timestamp getMaxGetCarTime() {
		return maxGetCarTime;
	}
	public void setMaxGetCarTime(Timestamp maxGetCarTime) {
		this.maxGetCarTime = maxGetCarTime;
	}
	public Timestamp getMinReturnCarTime() {
		return minReturnCarTime;
	}
	public void setMinReturnCarTime(Timestamp minReturnCarTime) {
		this.minReturnCarTime = minReturnCarTime;
	}
	public Timestamp getMaxReturnCarTime() {
		return maxReturnCarTime;
	}
	public void setMaxReturnCarTime(Timestamp maxReturnCarTime) {
		this.maxReturnCarTime = maxReturnCarTime;
	}
	public Timestamp getMinRealGetCarTime() {
		return minRealGetCarTime;
	}
	public void setMinRealGetCarTime(Timestamp minRealGetCarTime) {
		this.minRealGetCarTime = minRealGetCarTime;
	}
	public Timestamp getMaxRealGetCarTime() {
		return maxRealGetCarTime;
	}
	public void setMaxRealGetCarTime(Timestamp maxRealGetCarTime) {
		this.maxRealGetCarTime = maxRealGetCarTime;
	}
	public Timestamp getMinRealReturnCarTime() {
		return minRealReturnCarTime;
	}
	public void setMinRealReturnCarTime(Timestamp minRealReturnCarTime) {
		this.minRealReturnCarTime = minRealReturnCarTime;
	}
	public Timestamp getMaxRealReturnCarTime() {
		return maxRealReturnCarTime;
	}
	public void setMaxRealReturnCarTime(Timestamp maxRealReturnCarTime) {
		this.maxRealReturnCarTime = maxRealReturnCarTime;
	}
	
}
