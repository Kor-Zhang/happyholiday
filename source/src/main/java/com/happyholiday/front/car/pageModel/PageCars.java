package com.happyholiday.front.car.pageModel;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class PageCars implements Serializable{
	
	private String id;
	private String carBd;
	private String type;
	private String carLine;
	private Date year;
	private String address;
	private String seatType;
	private Integer seatNumber;
	private String fuelType;
	private String transmissionType;
	private Integer displacement;
	private String drivingMode;
	private String engineIntakeForm;
	private String skyWindow;
	private Integer fuelTankage;
	private String soundBox;
	private String reverseSensor;
	private Integer airSacNumber;
	private String dvd;
	private String gps;
	private Integer price;
	private Integer guidePrice;
	private Integer number;
	private Boolean isDelete;
	private Timestamp createTime;
	//租车列表时的图片名字
	private String mainImgName; 
	//订单界面的轮播图片名字
	private List<String> orderCarImgName;
	
	public List<String> getOrderCarImgName() {
		return orderCarImgName;
	}
	public void setOrderCarImgName(List<String> orderCarImgName) {
		this.orderCarImgName = orderCarImgName;
	}
	//分页属性
	private int  lowPrice ;
	private int  highPrice ;
	private Integer rows;
	private Integer page;
	//租期和地点
	private int rentDay;
	private  String fromAddress;
	private String backAddress;
	private Timestamp fromDate;
	private Timestamp backDate;	
	
	public String getFromAddress() {
		return fromAddress;
	}
	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}
	public String getBackAddress() {
		return backAddress;
	}
	public void setBackAddress(String backAddress) {
		this.backAddress = backAddress;
	}


	
	public Timestamp getFromDate() {
		return fromDate;
	}
	public void setFromDate(Timestamp fromDate) {
		this.fromDate = fromDate;
	}
	public Timestamp getBackDate() {
		return backDate;
	}
	public void setBackDate(Timestamp backDate) {
		this.backDate = backDate;
	}
	
	public String getMainImgName() {
		return mainImgName;
	}
	public void setMainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}
	public int getRentDay() {
		return rentDay;
	}
	public void setRentDay(int rentDay) {
		this.rentDay = rentDay;
	}
	public Date getYear() {
		return year;
	}
	public Integer getGuidePrice() {
		return guidePrice;
	}
	public void setGuidePrice(Integer guidePrice) {
		this.guidePrice = guidePrice;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSeatType() {
		return seatType;
	}
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	public Integer getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}
	public String getFuelType() {
		return fuelType;
	}
	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}
	public String getTransmissionType() {
		return transmissionType;
	}
	public void setTransmissionType(String transmissionType) {
		this.transmissionType = transmissionType;
	}
	public Integer getDisplacement() {
		return displacement;
	}
	public void setDisplacement(Integer displacement) {
		this.displacement = displacement;
	}
	public String getDrivingMode() {
		return drivingMode;
	}
	public void setDrivingMode(String drivingMode) {
		this.drivingMode = drivingMode;
	}
	public String getEngineIntakeForm() {
		return engineIntakeForm;
	}
	public void setEngineIntakeForm(String engineIntakeForm) {
		this.engineIntakeForm = engineIntakeForm;
	}
	public String getSkyWindow() {
		return skyWindow;
	}
	public void setSkyWindow(String skyWindow) {
		this.skyWindow = skyWindow;
	}
	public Integer getFuelTankage() {
		return fuelTankage;
	}
	public void setFuelTankage(Integer fuelTankage) {
		this.fuelTankage = fuelTankage;
	}
	public String getSoundBox() {
		return soundBox;
	}
	public void setSoundBox(String soundBox) {
		this.soundBox = soundBox;
	}
	public String getReverseSensor() {
		return reverseSensor;
	}
	public void setReverseSensor(String reverseSensor) {
		this.reverseSensor = reverseSensor;
	}
	public Integer getAirSacNumber() {
		return airSacNumber;
	}
	public void setAirSacNumber(Integer airSacNumber) {
		this.airSacNumber = airSacNumber;
	}
	public String getDvd() {
		return dvd;
	}
	public void setDvd(String dvd) {
		this.dvd = dvd;
	}
	public String getGps() {
		return gps;
	}
	public void setGps(String gps) {
		this.gps = gps;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

		
	
	public int getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}
	public int getHighPrice() {
		return highPrice;
	}
	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCarBd() {
		return carBd;
	}
	public void setCarBd(String carBd) {
		this.carBd = carBd;
	}
	public String getCarLine() {
		return carLine;
	}
	public void setCarLine(String carLine) {
		this.carLine = carLine;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
