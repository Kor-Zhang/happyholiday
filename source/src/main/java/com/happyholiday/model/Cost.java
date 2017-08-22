package com.happyholiday.model;

import java.sql.Timestamp;
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
 * Cost entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "cost", catalog = "happyholiday")
public class Cost implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String introduction;
	private Double price;
	private String belong;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Boolean isDelete;
	private Set<Rentcarcost> rentcarcosts = new HashSet<Rentcarcost>(0);

	// Constructors

	/** default constructor */
	public Cost() {
	}

	/** minimal constructor */
	public Cost(String id, String name, String introduction, Double price,
			String belong, Timestamp createTime, Timestamp updateTime,
			Boolean isDelete) {
		this.id = id;
		this.name = name;
		this.introduction = introduction;
		this.price = price;
		this.belong = belong;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.isDelete = isDelete;
	}

	/** full constructor */
	public Cost(String id, String name, String introduction, Double price,
			String belong, Timestamp createTime, Timestamp updateTime,
			Boolean isDelete, Set<Rentcarcost> rentcarcosts) {
		this.id = id;
		this.name = name;
		this.introduction = introduction;
		this.price = price;
		this.belong = belong;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.isDelete = isDelete;
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

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "introduction", nullable = false)
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "price", nullable = false, precision = 22, scale = 0)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "belong", nullable = false)
	public String getBelong() {
		return this.belong;
	}

	public void setBelong(String belong) {
		this.belong = belong;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "cost")
	public Set<Rentcarcost> getRentcarcosts() {
		return this.rentcarcosts;
	}

	public void setRentcarcosts(Set<Rentcarcost> rentcarcosts) {
		this.rentcarcosts = rentcarcosts;
	}

}