package com.happyholiday.admin.cars.pageModel;

import java.io.File;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;

import com.happyholiday.pagemodel.BaseReceivePage;

public class PageCars extends BaseReceivePage{
	
	private String deleteCarImgIds = "";
	
	
	
	private String imgName; 
	private String id;
	private String carBd;
	private String type;
	private Date year;
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
	private String address;
	private String carLine;
	
	
	/**************查询条件********************/
	private String searchImgName; 
	private String searchId;
	private String searchCarBd;
	private String searchType;
	private String searchSeatType;
	private Integer searchSeatNumber;
	private String searchFuelType;
	private String searchTransmissionType;
	private Integer searchDisplacement;
	private String searchDrivingMode;
	private String searchEngineIntakeForm;
	private String searchSkyWindow;
	private Integer searchFuelTankage;
	private String searchSoundBox;
	private String searchReverseSensor;
	private Integer searchAirSacNumber;
	private String searchDvd;
	private String searchGps;
	private Boolean searchIsDelete;
	private Timestamp searchCreateTime;
	private String searchAddress;
	private String searchCarLine;
	private Date maxYear;
	private Date minYear;

	private Integer maxGuidePrice;
	private Integer minGuidePrice;
	private Integer maxPrice;
	private Integer minPrice;
	private Integer maxNumber;
	private Integer minNumber;
	
	
	
	public Integer getMaxGuidePrice() {
		return maxGuidePrice;
	}
	public void setMaxGuidePrice(Integer maxGuidePrice) {
		this.maxGuidePrice = maxGuidePrice;
	}
	public Integer getMinGuidePrice() {
		return minGuidePrice;
	}
	public void setMinGuidePrice(Integer minGuidePrice) {
		this.minGuidePrice = minGuidePrice;
	}
	public Integer getGuidePrice() {
		return guidePrice;
	}
	public void setGuidePrice(Integer guidePrice) {
		this.guidePrice = guidePrice;
	}
	public String getDeleteCarImgIds() {
		return deleteCarImgIds;
	}
	public void setDeleteCarImgIds(String deleteCarImgIds) {
		this.deleteCarImgIds = deleteCarImgIds;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCarLine() {
		return carLine;
	}
	public void setCarLine(String carLine) {
		this.carLine = carLine;
	}
	public String getSearchImgName() {
		return searchImgName;
	}
	public void setSearchImgName(String searchImgName) {
		this.searchImgName = searchImgName;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getSearchCarBd() {
		return searchCarBd;
	}
	public void setSearchCarBd(String searchCarBd) {
		this.searchCarBd = searchCarBd;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchSeatType() {
		return searchSeatType;
	}
	public void setSearchSeatType(String searchSeatType) {
		this.searchSeatType = searchSeatType;
	}
	public Integer getSearchSeatNumber() {
		return searchSeatNumber;
	}
	public void setSearchSeatNumber(Integer searchSeatNumber) {
		this.searchSeatNumber = searchSeatNumber;
	}
	public String getSearchFuelType() {
		return searchFuelType;
	}
	public void setSearchFuelType(String searchFuelType) {
		this.searchFuelType = searchFuelType;
	}
	public String getSearchTransmissionType() {
		return searchTransmissionType;
	}
	public void setSearchTransmissionType(String searchTransmissionType) {
		this.searchTransmissionType = searchTransmissionType;
	}
	public Integer getSearchDisplacement() {
		return searchDisplacement;
	}
	public void setSearchDisplacement(Integer searchDisplacement) {
		this.searchDisplacement = searchDisplacement;
	}
	public String getSearchDrivingMode() {
		return searchDrivingMode;
	}
	public void setSearchDrivingMode(String searchDrivingMode) {
		this.searchDrivingMode = searchDrivingMode;
	}
	public String getSearchEngineIntakeForm() {
		return searchEngineIntakeForm;
	}
	public void setSearchEngineIntakeForm(String searchEngineIntakeForm) {
		this.searchEngineIntakeForm = searchEngineIntakeForm;
	}
	public String getSearchSkyWindow() {
		return searchSkyWindow;
	}
	public void setSearchSkyWindow(String searchSkyWindow) {
		this.searchSkyWindow = searchSkyWindow;
	}
	public Integer getSearchFuelTankage() {
		return searchFuelTankage;
	}
	public void setSearchFuelTankage(Integer searchFuelTankage) {
		this.searchFuelTankage = searchFuelTankage;
	}
	public String getSearchSoundBox() {
		return searchSoundBox;
	}
	public void setSearchSoundBox(String searchSoundBox) {
		this.searchSoundBox = searchSoundBox;
	}
	public String getSearchReverseSensor() {
		return searchReverseSensor;
	}
	public void setSearchReverseSensor(String searchReverseSensor) {
		this.searchReverseSensor = searchReverseSensor;
	}
	public Integer getSearchAirSacNumber() {
		return searchAirSacNumber;
	}
	public void setSearchAirSacNumber(Integer searchAirSacNumber) {
		this.searchAirSacNumber = searchAirSacNumber;
	}
	public String getSearchDvd() {
		return searchDvd;
	}
	public void setSearchDvd(String searchDvd) {
		this.searchDvd = searchDvd;
	}
	public String getSearchGps() {
		return searchGps;
	}
	public void setSearchGps(String searchGps) {
		this.searchGps = searchGps;
	}
	public Boolean getSearchIsDelete() {
		return searchIsDelete;
	}
	public void setSearchIsDelete(Boolean searchIsDelete) {
		this.searchIsDelete = searchIsDelete;
	}
	public Timestamp getSearchCreateTime() {
		return searchCreateTime;
	}
	public void setSearchCreateTime(Timestamp searchCreateTime) {
		this.searchCreateTime = searchCreateTime;
	}
	public String getSearchAddress() {
		return searchAddress;
	}
	public void setSearchAddress(String searchAddress) {
		this.searchAddress = searchAddress;
	}
	public String getSearchCarLine() {
		return searchCarLine;
	}
	public void setSearchCarLine(String searchCarLine) {
		this.searchCarLine = searchCarLine;
	}
	public Date getMaxYear() {
		return maxYear;
	}
	public void setMaxYear(Date maxYear) {
		this.maxYear = maxYear;
	}
	public Date getMinYear() {
		return minYear;
	}
	public void setMinYear(Date minYear) {
		this.minYear = minYear;
	}
	public Integer getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}
	public Integer getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Integer minPrice) {
		this.minPrice = minPrice;
	}
	public Integer getMaxNumber() {
		return maxNumber;
	}
	public void setMaxNumber(Integer maxNumber) {
		this.maxNumber = maxNumber;
	}
	public Integer getMinNumber() {
		return minNumber;
	}
	public void setMinNumber(Integer minNumber) {
		this.minNumber = minNumber;
	}
	
}
