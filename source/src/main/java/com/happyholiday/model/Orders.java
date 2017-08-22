package com.happyholiday.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "orders", catalog = "happyholiday")
public class Orders implements java.io.Serializable {

	// Fields

	private String id;
	private Cars cars;
	private Rentcarusers rentcarusers;
	private Users users;
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
	private Set<Rentcarcost> rentcarcosts = new HashSet<Rentcarcost>(0);

	// Constructors

	/** default constructor */
	public Orders() {
	}

	/** minimal constructor */
	public Orders(String id, Cars cars, Users users, Timestamp submitTime,
			String getCarAddress, String returnCarAddress,
			Timestamp getCarTime, Timestamp returnCarTime, Integer status,
			Boolean isDelete, Double carPrice, Integer rentDayNumber,
			Double totalPrice) {
		this.id = id;
		this.cars = cars;
		this.users = users;
		this.submitTime = submitTime;
		this.getCarAddress = getCarAddress;
		this.returnCarAddress = returnCarAddress;
		this.getCarTime = getCarTime;
		this.returnCarTime = returnCarTime;
		this.status = status;
		this.isDelete = isDelete;
		this.carPrice = carPrice;
		this.rentDayNumber = rentDayNumber;
		this.totalPrice = totalPrice;
	}

	/** full constructor */
	public Orders(String id, Cars cars, Rentcarusers rentcarusers, Users users,
			Timestamp submitTime, String getCarAddress,
			String returnCarAddress, Timestamp getCarTime,
			Timestamp returnCarTime, Integer status, Timestamp realGetCarTime,
			Timestamp realReturnCarTime, String realGetCarAddress,
			String realReturnCarAddress, Boolean isDelete, String userNote,
			String adminNote, Double carPrice, Integer rentDayNumber,
			Double totalPrice, Set<Rentcarcost> rentcarcosts) {
		this.id = id;
		this.cars = cars;
		this.rentcarusers = rentcarusers;
		this.users = users;
		this.submitTime = submitTime;
		this.getCarAddress = getCarAddress;
		this.returnCarAddress = returnCarAddress;
		this.getCarTime = getCarTime;
		this.returnCarTime = returnCarTime;
		this.status = status;
		this.realGetCarTime = realGetCarTime;
		this.realReturnCarTime = realReturnCarTime;
		this.realGetCarAddress = realGetCarAddress;
		this.realReturnCarAddress = realReturnCarAddress;
		this.isDelete = isDelete;
		this.userNote = userNote;
		this.adminNote = adminNote;
		this.carPrice = carPrice;
		this.rentDayNumber = rentDayNumber;
		this.totalPrice = totalPrice;
		this.rentcarcosts = rentcarcosts;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "carId", nullable = false)
	public Cars getCars() {
		return this.cars;
	}

	public void setCars(Cars cars) {
		this.cars = cars;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rentCarUserId")
	public Rentcarusers getRentcarusers() {
		return this.rentcarusers;
	}

	public void setRentcarusers(Rentcarusers rentcarusers) {
		this.rentcarusers = rentcarusers;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "submitTime", nullable = false, length = 19)
	public Timestamp getSubmitTime() {
		return this.submitTime;
	}

	public void setSubmitTime(Timestamp submitTime) {
		this.submitTime = submitTime;
	}

	@Column(name = "getCarAddress", nullable = false)
	public String getGetCarAddress() {
		return this.getCarAddress;
	}

	public void setGetCarAddress(String getCarAddress) {
		this.getCarAddress = getCarAddress;
	}

	@Column(name = "returnCarAddress", nullable = false)
	public String getReturnCarAddress() {
		return this.returnCarAddress;
	}

	public void setReturnCarAddress(String returnCarAddress) {
		this.returnCarAddress = returnCarAddress;
	}

	@Column(name = "getCarTime", nullable = false, length = 19)
	public Timestamp getGetCarTime() {
		return this.getCarTime;
	}

	public void setGetCarTime(Timestamp getCarTime) {
		this.getCarTime = getCarTime;
	}

	@Column(name = "returnCarTime", nullable = false, length = 19)
	public Timestamp getReturnCarTime() {
		return this.returnCarTime;
	}

	public void setReturnCarTime(Timestamp returnCarTime) {
		this.returnCarTime = returnCarTime;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "realGetCarTime", length = 19)
	public Timestamp getRealGetCarTime() {
		return this.realGetCarTime;
	}

	public void setRealGetCarTime(Timestamp realGetCarTime) {
		this.realGetCarTime = realGetCarTime;
	}

	@Column(name = "realReturnCarTime", length = 19)
	public Timestamp getRealReturnCarTime() {
		return this.realReturnCarTime;
	}

	public void setRealReturnCarTime(Timestamp realReturnCarTime) {
		this.realReturnCarTime = realReturnCarTime;
	}

	@Column(name = "realGetCarAddress")
	public String getRealGetCarAddress() {
		return this.realGetCarAddress;
	}

	public void setRealGetCarAddress(String realGetCarAddress) {
		this.realGetCarAddress = realGetCarAddress;
	}

	@Column(name = "realReturnCarAddress")
	public String getRealReturnCarAddress() {
		return this.realReturnCarAddress;
	}

	public void setRealReturnCarAddress(String realReturnCarAddress) {
		this.realReturnCarAddress = realReturnCarAddress;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Column(name = "userNote")
	public String getUserNote() {
		return this.userNote;
	}

	public void setUserNote(String userNote) {
		this.userNote = userNote;
	}

	@Column(name = "adminNote")
	public String getAdminNote() {
		return this.adminNote;
	}

	public void setAdminNote(String adminNote) {
		this.adminNote = adminNote;
	}

	@Column(name = "carPrice", nullable = false, precision = 22, scale = 0)
	public Double getCarPrice() {
		return this.carPrice;
	}

	public void setCarPrice(Double carPrice) {
		this.carPrice = carPrice;
	}

	@Column(name = "rentDayNumber", nullable = false)
	public Integer getRentDayNumber() {
		return this.rentDayNumber;
	}

	public void setRentDayNumber(Integer rentDayNumber) {
		this.rentDayNumber = rentDayNumber;
	}

	@Column(name = "totalPrice", nullable = false, precision = 255, scale = 0)
	public Double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "orders")
	public Set<Rentcarcost> getRentcarcosts() {
		return this.rentcarcosts;
	}

	public void setRentcarcosts(Set<Rentcarcost> rentcarcosts) {
		this.rentcarcosts = rentcarcosts;
	}

}