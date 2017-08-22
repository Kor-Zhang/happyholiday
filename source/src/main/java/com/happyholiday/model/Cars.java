package com.happyholiday.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Cars entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "cars", catalog = "happyholiday")
public class Cars implements java.io.Serializable {

	// Fields

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
	private Set<Orders> orderses = new HashSet<Orders>(0);
	private Set<Recommendcars> recommendcarses = new HashSet<Recommendcars>(0);
	private Set<Carimgs> carimgses = new HashSet<Carimgs>(0);

	// Constructors

	/** default constructor */
	public Cars() {
	}

	/** minimal constructor */
	public Cars(String id, String carBd, String type, String carLine,
			Date year, String address, Integer price, Integer guidePrice,
			Integer number, Boolean isDelete, Timestamp createTime) {
		this.id = id;
		this.carBd = carBd;
		this.type = type;
		this.carLine = carLine;
		this.year = year;
		this.address = address;
		this.price = price;
		this.guidePrice = guidePrice;
		this.number = number;
		this.isDelete = isDelete;
		this.createTime = createTime;
	}

	/** full constructor */
	public Cars(String id, String carBd, String type, String carLine,
			Date year, String address, String seatType, Integer seatNumber,
			String fuelType, String transmissionType, Integer displacement,
			String drivingMode, String engineIntakeForm, String skyWindow,
			Integer fuelTankage, String soundBox, String reverseSensor,
			Integer airSacNumber, String dvd, String gps, Integer price,
			Integer guidePrice, Integer number, Boolean isDelete,
			Timestamp createTime, Set<Orders> orderses,
			Set<Recommendcars> recommendcarses, Set<Carimgs> carimgses) {
		this.id = id;
		this.carBd = carBd;
		this.type = type;
		this.carLine = carLine;
		this.year = year;
		this.address = address;
		this.seatType = seatType;
		this.seatNumber = seatNumber;
		this.fuelType = fuelType;
		this.transmissionType = transmissionType;
		this.displacement = displacement;
		this.drivingMode = drivingMode;
		this.engineIntakeForm = engineIntakeForm;
		this.skyWindow = skyWindow;
		this.fuelTankage = fuelTankage;
		this.soundBox = soundBox;
		this.reverseSensor = reverseSensor;
		this.airSacNumber = airSacNumber;
		this.dvd = dvd;
		this.gps = gps;
		this.price = price;
		this.guidePrice = guidePrice;
		this.number = number;
		this.isDelete = isDelete;
		this.createTime = createTime;
		this.orderses = orderses;
		this.recommendcarses = recommendcarses;
		this.carimgses = carimgses;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "carBd", nullable = false)
	public String getCarBd() {
		return this.carBd;
	}

	public void setCarBd(String carBd) {
		this.carBd = carBd;
	}

	@Column(name = "type", nullable = false)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "carLine", nullable = false)
	public String getCarLine() {
		return this.carLine;
	}

	public void setCarLine(String carLine) {
		this.carLine = carLine;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "year", nullable = false, length = 10)
	public Date getYear() {
		return this.year;
	}

	public void setYear(Date year) {
		this.year = year;
	}

	@Column(name = "address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "seatType")
	public String getSeatType() {
		return this.seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	@Column(name = "seatNumber")
	public Integer getSeatNumber() {
		return this.seatNumber;
	}

	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}

	@Column(name = "fuelType")
	public String getFuelType() {
		return this.fuelType;
	}

	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}

	@Column(name = "transmissionType")
	public String getTransmissionType() {
		return this.transmissionType;
	}

	public void setTransmissionType(String transmissionType) {
		this.transmissionType = transmissionType;
	}

	@Column(name = "displacement")
	public Integer getDisplacement() {
		return this.displacement;
	}

	public void setDisplacement(Integer displacement) {
		this.displacement = displacement;
	}

	@Column(name = "drivingMode")
	public String getDrivingMode() {
		return this.drivingMode;
	}

	public void setDrivingMode(String drivingMode) {
		this.drivingMode = drivingMode;
	}

	@Column(name = "engineIntakeForm")
	public String getEngineIntakeForm() {
		return this.engineIntakeForm;
	}

	public void setEngineIntakeForm(String engineIntakeForm) {
		this.engineIntakeForm = engineIntakeForm;
	}

	@Column(name = "skyWindow")
	public String getSkyWindow() {
		return this.skyWindow;
	}

	public void setSkyWindow(String skyWindow) {
		this.skyWindow = skyWindow;
	}

	@Column(name = "fuelTankage")
	public Integer getFuelTankage() {
		return this.fuelTankage;
	}

	public void setFuelTankage(Integer fuelTankage) {
		this.fuelTankage = fuelTankage;
	}

	@Column(name = "soundBox")
	public String getSoundBox() {
		return this.soundBox;
	}

	public void setSoundBox(String soundBox) {
		this.soundBox = soundBox;
	}

	@Column(name = "reverseSensor")
	public String getReverseSensor() {
		return this.reverseSensor;
	}

	public void setReverseSensor(String reverseSensor) {
		this.reverseSensor = reverseSensor;
	}

	@Column(name = "airSacNumber")
	public Integer getAirSacNumber() {
		return this.airSacNumber;
	}

	public void setAirSacNumber(Integer airSacNumber) {
		this.airSacNumber = airSacNumber;
	}

	@Column(name = "dvd")
	public String getDvd() {
		return this.dvd;
	}

	public void setDvd(String dvd) {
		this.dvd = dvd;
	}

	@Column(name = "gps")
	public String getGps() {
		return this.gps;
	}

	public void setGps(String gps) {
		this.gps = gps;
	}

	@Column(name = "price", nullable = false)
	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Column(name = "guidePrice", nullable = false)
	public Integer getGuidePrice() {
		return this.guidePrice;
	}

	public void setGuidePrice(Integer guidePrice) {
		this.guidePrice = guidePrice;
	}

	@Column(name = "number", nullable = false)
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Column(name = "createTime", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "cars")
	public Set<Orders> getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set<Orders> orderses) {
		this.orderses = orderses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "cars")
	public Set<Recommendcars> getRecommendcarses() {
		return this.recommendcarses;
	}

	public void setRecommendcarses(Set<Recommendcars> recommendcarses) {
		this.recommendcarses = recommendcarses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "cars")
	public Set<Carimgs> getCarimgses() {
		return this.carimgses;
	}

	public void setCarimgses(Set<Carimgs> carimgses) {
		this.carimgses = carimgses;
	}

}