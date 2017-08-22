package com.happyholiday.admin.cars.pageModel;

import java.io.File;
import java.util.Arrays;
import java.util.Date;

public class PageCarUpload {
	// 用来封装上传的文件  
    private File[] uploadFile;  
    //用来封装上传文件的类型  
    private String[] uploadFileContentType; 
    private Integer page = 0;
	private Integer rows = 0;
	private String sort = "id";
	private String order = "desc";
	private String searchId = "";
	private String deleteIds = "";
	private String deleteCarImgIds = "";
	private String imgName; 
    private Integer mainNumber = 0;
   
    
    
    
	private String id;
	private String carBd;
	private String carLine;
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
	private String address;
	
	
	
	
	
	

	
	public Integer getGuidePrice() {
		return guidePrice;
	}
	public void setGuidePrice(Integer guidePrice) {
		this.guidePrice = guidePrice;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getMainNumber() {
		return mainNumber;
	}
	public void setMainNumber(Integer mainNumber) {
		this.mainNumber = mainNumber;
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
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getDeleteIds() {
		return deleteIds;
	}
	public void setDeleteIds(String deleteIds) {
		this.deleteIds = deleteIds;
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
	
	
	
    public PageCarUpload() {
		super();
		// TODO Auto-generated constructor stub
	}
	public File[] getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(File[] uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getUploadFileContentType() {
		return uploadFileContentType;
	}
	public void setUploadFileContentType(String[] uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}
	
	
}
