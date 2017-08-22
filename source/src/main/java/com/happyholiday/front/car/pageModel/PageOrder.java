package com.happyholiday.front.car.pageModel;

import java.sql.Timestamp;

public class PageOrder {
	private String id;
	private String userId;
	private String carId;
	private String rentCarUserId;
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
	private Boolean isDelete;
	private String userNote;
	private String adminNote;
	private Double carPrice;
	private Integer rentDayNumber;
	private Double totalPrice;
	
	//个人中心 查询订单的状态
	private Timestamp startTime;
	private Timestamp endTime;
	private String type;
	//分页属性
	private Integer rows;
	private Integer page;
	//汽车属性
	private String carBd;
	private String seatType;
	private String drivingMode;
	private Integer seatNumber;
	private String mainImgName; 
	
	public String getMainImgName() {
		return mainImgName;
	}
	public void setMainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}
	public String getCarBd() {
		return carBd;
	}
	public void setCarBd(String carBd) {
		this.carBd = carBd;
	}
	public String getSeatType() {
		return seatType;
	}
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	public String getDrivingMode() {
		return drivingMode;
	}
	public void setDrivingMode(String drivingMode) {
		this.drivingMode = drivingMode;
	}
	public Integer getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getCarId() {
		return carId;
	}


	public void setCarId(String carId) {
		this.carId = carId;
	}


	public String getRentCarUserId() {
		return rentCarUserId;
	}


	public void setRentCarUserId(String rentCarUserId) {
		this.rentCarUserId = rentCarUserId;
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


	public Double getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}


	@Override
	public String toString() {
		return "PageOrder [id=" + id + ", userId=" + userId + ", carId="
				+ carId + ", rentCarUserId=" + rentCarUserId + ", submitTime="
				+ submitTime + ", getCarAddress=" + getCarAddress
				+ ", returnCarAddress=" + returnCarAddress + ", getCarTime="
				+ getCarTime + ", returnCarTime=" + returnCarTime + ", status="
				+ status + ", realGetCarTime=" + realGetCarTime
				+ ", realReturnCarTime=" + realReturnCarTime
				+ ", realGetCarAddress=" + realGetCarAddress
				+ ", realReturnCarAddress=" + realReturnCarAddress
				+ ", isDelete=" + isDelete + ", userNote=" + userNote
				+ ", adminNote=" + adminNote + ", carPrice=" + carPrice
				+ ", rentDayNumber=" + rentDayNumber + ", totalPrice="
				+ totalPrice + "]";
	}
	
}
