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
 * Rentcarcost entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "rentcarcost", catalog = "happyholiday")
public class Rentcarcost implements java.io.Serializable {

	// Fields

	private String id;
	private Cost cost;
	private Orders orders;
	private Integer number;
	private Double price;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Boolean isDelete;

	// Constructors

	/** default constructor */
	public Rentcarcost() {
	}

	/** full constructor */
	public Rentcarcost(String id, Cost cost, Orders orders, Integer number,
			Double price, Timestamp createTime, Timestamp updateTime,
			Boolean isDelete) {
		this.id = id;
		this.cost = cost;
		this.orders = orders;
		this.number = number;
		this.price = price;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.isDelete = isDelete;
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
	@JoinColumn(name = "costId", nullable = false)
	public Cost getCost() {
		return this.cost;
	}

	public void setCost(Cost cost) {
		this.cost = cost;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orderId", nullable = false)
	public Orders getOrders() {
		return this.orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	@Column(name = "number", nullable = false)
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "price", nullable = false, precision = 22, scale = 0)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "createTime", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "updateTime", nullable = false, length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

}