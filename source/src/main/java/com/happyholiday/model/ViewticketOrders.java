package com.happyholiday.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ViewticketOrders entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "viewticket_orders", catalog = "happyholiday")
public class ViewticketOrders implements java.io.Serializable {

	// Fields

	private String id;
	private ViewticketTickets viewticketTickets;
	private Users users;
	private Timestamp travelTime;
	private Integer price;
	private Integer totalPrice;
	private Integer number;
	private String getTicketName;
	private String getTicketPhone;
	private Boolean isDelete;
	private Timestamp createTime;
	private Integer status;

	// Constructors

	/** default constructor */
	public ViewticketOrders() {
	}

	/** full constructor */
	public ViewticketOrders(String id, ViewticketTickets viewticketTickets,
			Users users, Timestamp travelTime, Integer price,
			Integer totalPrice, Integer number, String getTicketName,
			String getTicketPhone, Boolean isDelete, Timestamp createTime,
			Integer status) {
		this.id = id;
		this.viewticketTickets = viewticketTickets;
		this.users = users;
		this.travelTime = travelTime;
		this.price = price;
		this.totalPrice = totalPrice;
		this.number = number;
		this.getTicketName = getTicketName;
		this.getTicketPhone = getTicketPhone;
		this.isDelete = isDelete;
		this.createTime = createTime;
		this.status = status;
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
	@JoinColumn(name = "ticketId", nullable = false)
	public ViewticketTickets getViewticketTickets() {
		return this.viewticketTickets;
	}

	public void setViewticketTickets(ViewticketTickets viewticketTickets) {
		this.viewticketTickets = viewticketTickets;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "travelTime", nullable = false, length = 19)
	public Timestamp getTravelTime() {
		return this.travelTime;
	}

	public void setTravelTime(Timestamp travelTime) {
		this.travelTime = travelTime;
	}

	@Column(name = "price", nullable = false)
	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Column(name = "totalPrice", nullable = false)
	public Integer getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "number", nullable = false)
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "getTicketName", nullable = false)
	public String getGetTicketName() {
		return this.getTicketName;
	}

	public void setGetTicketName(String getTicketName) {
		this.getTicketName = getTicketName;
	}

	@Column(name = "getTicketPhone", nullable = false, length = 11)
	public String getGetTicketPhone() {
		return this.getTicketPhone;
	}

	public void setGetTicketPhone(String getTicketPhone) {
		this.getTicketPhone = getTicketPhone;
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

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}