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
 * ViewticketTickets entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "viewticket_tickets", catalog = "happyholiday")
public class ViewticketTickets implements java.io.Serializable {

	// Fields

	private String id;
	private ViewticketViews viewticketViews;
	private String name;
	private String type;
	private String style;
	private String orderTime;
	private Integer marketPrice;
	private Integer happyPrice;
	private String payType;
	private Boolean isDelete;
	private Timestamp creatTime;
	private Set<ViewticketOrders> viewticketOrderses = new HashSet<ViewticketOrders>(
			0);

	// Constructors

	/** default constructor */
	public ViewticketTickets() {
	}

	/** minimal constructor */
	public ViewticketTickets(String id, ViewticketViews viewticketViews,
			String name, String type, String style, String orderTime,
			Integer marketPrice, Integer happyPrice, String payType,
			Boolean isDelete, Timestamp creatTime) {
		this.id = id;
		this.viewticketViews = viewticketViews;
		this.name = name;
		this.type = type;
		this.style = style;
		this.orderTime = orderTime;
		this.marketPrice = marketPrice;
		this.happyPrice = happyPrice;
		this.payType = payType;
		this.isDelete = isDelete;
		this.creatTime = creatTime;
	}

	/** full constructor */
	public ViewticketTickets(String id, ViewticketViews viewticketViews,
			String name, String type, String style, String orderTime,
			Integer marketPrice, Integer happyPrice, String payType,
			Boolean isDelete, Timestamp creatTime,
			Set<ViewticketOrders> viewticketOrderses) {
		this.id = id;
		this.viewticketViews = viewticketViews;
		this.name = name;
		this.type = type;
		this.style = style;
		this.orderTime = orderTime;
		this.marketPrice = marketPrice;
		this.happyPrice = happyPrice;
		this.payType = payType;
		this.isDelete = isDelete;
		this.creatTime = creatTime;
		this.viewticketOrderses = viewticketOrderses;
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
	@JoinColumn(name = "viewId", nullable = false)
	public ViewticketViews getViewticketViews() {
		return this.viewticketViews;
	}

	public void setViewticketViews(ViewticketViews viewticketViews) {
		this.viewticketViews = viewticketViews;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "type", nullable = false)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "style", nullable = false)
	public String getStyle() {
		return this.style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	@Column(name = "orderTime", nullable = false)
	public String getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	@Column(name = "marketPrice", nullable = false)
	public Integer getMarketPrice() {
		return this.marketPrice;
	}

	public void setMarketPrice(Integer marketPrice) {
		this.marketPrice = marketPrice;
	}

	@Column(name = "happyPrice", nullable = false)
	public Integer getHappyPrice() {
		return this.happyPrice;
	}

	public void setHappyPrice(Integer happyPrice) {
		this.happyPrice = happyPrice;
	}

	@Column(name = "payType", nullable = false)
	public String getPayType() {
		return this.payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Column(name = "creatTime", nullable = false, length = 19)
	public Timestamp getCreatTime() {
		return this.creatTime;
	}

	public void setCreatTime(Timestamp creatTime) {
		this.creatTime = creatTime;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "viewticketTickets")
	public Set<ViewticketOrders> getViewticketOrderses() {
		return this.viewticketOrderses;
	}

	public void setViewticketOrderses(Set<ViewticketOrders> viewticketOrderses) {
		this.viewticketOrderses = viewticketOrderses;
	}

}