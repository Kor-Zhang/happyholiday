package com.happyholiday.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Rentcarusers entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "rentcarusers", catalog = "happyholiday")
public class Rentcarusers implements java.io.Serializable {

	// Fields

	private String id;
	private String phone;
	private String realName;
	private String email;
	private String cardClazz;
	private String cardNumber;
	private Boolean isDelete;
	private Set<Orders> orderses = new HashSet<Orders>(0);

	// Constructors

	/** default constructor */
	public Rentcarusers() {
	}

	/** minimal constructor */
	public Rentcarusers(String id, String phone, String realName,
			String cardClazz, String cardNumber, Boolean isDelete) {
		this.id = id;
		this.phone = phone;
		this.realName = realName;
		this.cardClazz = cardClazz;
		this.cardNumber = cardNumber;
		this.isDelete = isDelete;
	}

	/** full constructor */
	public Rentcarusers(String id, String phone, String realName, String email,
			String cardClazz, String cardNumber, Boolean isDelete,
			Set<Orders> orderses) {
		this.id = id;
		this.phone = phone;
		this.realName = realName;
		this.email = email;
		this.cardClazz = cardClazz;
		this.cardNumber = cardNumber;
		this.isDelete = isDelete;
		this.orderses = orderses;
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

	@Column(name = "phone", nullable = false, length = 11)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "realName", nullable = false)
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "cardClazz", nullable = false)
	public String getCardClazz() {
		return this.cardClazz;
	}

	public void setCardClazz(String cardClazz) {
		this.cardClazz = cardClazz;
	}

	@Column(name = "cardNumber", nullable = false)
	public String getCardNumber() {
		return this.cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	@Column(name = "isDelete", nullable = false)
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "rentcarusers")
	public Set<Orders> getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set<Orders> orderses) {
		this.orderses = orderses;
	}

}