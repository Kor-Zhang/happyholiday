package com.happyholiday.model;

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
import javax.persistence.UniqueConstraint;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "users", catalog = "happyholiday", uniqueConstraints = @UniqueConstraint(columnNames = "phone"))
public class Users implements java.io.Serializable {

	// Fields

	private String id;
	private Imgs imgs;
	private String phone;
	private String userName;
	private String realName;
	private String password;
	private Integer status;
	private Integer role;
	private String email;
	private String cardClazz;
	private String cardNumber;
	private Boolean isDelete;
	private String head;
	private Set<Userupdaterecord> userupdaterecords = new HashSet<Userupdaterecord>(
			0);
	private Set<ViewticketOrders> viewticketOrderses = new HashSet<ViewticketOrders>(
			0);
	private Set<Orders> orderses = new HashSet<Orders>(0);
	private Set<Userloginrecord> userloginrecords = new HashSet<Userloginrecord>(
			0);

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String id, String phone, String password, Integer status,
			Integer role, Boolean isDelete, String head) {
		this.id = id;
		this.phone = phone;
		this.password = password;
		this.status = status;
		this.role = role;
		this.isDelete = isDelete;
		this.head = head;
	}

	/** full constructor */
	public Users(String id, Imgs imgs, String phone, String userName,
			String realName, String password, Integer status, Integer role,
			String email, String cardClazz, String cardNumber,
			Boolean isDelete, String head,
			Set<Userupdaterecord> userupdaterecords,
			Set<ViewticketOrders> viewticketOrderses, Set<Orders> orderses,
			Set<Userloginrecord> userloginrecords) {
		this.id = id;
		this.imgs = imgs;
		this.phone = phone;
		this.userName = userName;
		this.realName = realName;
		this.password = password;
		this.status = status;
		this.role = role;
		this.email = email;
		this.cardClazz = cardClazz;
		this.cardNumber = cardNumber;
		this.isDelete = isDelete;
		this.head = head;
		this.userupdaterecords = userupdaterecords;
		this.viewticketOrderses = viewticketOrderses;
		this.orderses = orderses;
		this.userloginrecords = userloginrecords;
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
	@JoinColumn(name = "guideVerifyImgId")
	public Imgs getImgs() {
		return this.imgs;
	}

	public void setImgs(Imgs imgs) {
		this.imgs = imgs;
	}

	@Column(name = "phone", unique = true, nullable = false, length = 11)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "userName")
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "realName")
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "password", nullable = false, length = 36)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "role", nullable = false)
	public Integer getRole() {
		return this.role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "cardClazz")
	public String getCardClazz() {
		return this.cardClazz;
	}

	public void setCardClazz(String cardClazz) {
		this.cardClazz = cardClazz;
	}

	@Column(name = "cardNumber")
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

	@Column(name = "head", nullable = false)
	public String getHead() {
		return this.head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Userupdaterecord> getUserupdaterecords() {
		return this.userupdaterecords;
	}

	public void setUserupdaterecords(Set<Userupdaterecord> userupdaterecords) {
		this.userupdaterecords = userupdaterecords;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<ViewticketOrders> getViewticketOrderses() {
		return this.viewticketOrderses;
	}

	public void setViewticketOrderses(Set<ViewticketOrders> viewticketOrderses) {
		this.viewticketOrderses = viewticketOrderses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Orders> getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set<Orders> orderses) {
		this.orderses = orderses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Userloginrecord> getUserloginrecords() {
		return this.userloginrecords;
	}

	public void setUserloginrecords(Set<Userloginrecord> userloginrecords) {
		this.userloginrecords = userloginrecords;
	}

}