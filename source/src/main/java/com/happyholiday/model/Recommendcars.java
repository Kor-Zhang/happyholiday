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
 * Recommendcars entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "recommendcars", catalog = "happyholiday")
public class Recommendcars implements java.io.Serializable {

	// Fields

	private String id;
	private Cars cars;
	private String introduction;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public Recommendcars() {
	}

	/** full constructor */
	public Recommendcars(String id, Cars cars, String introduction,
			Timestamp createTime) {
		this.id = id;
		this.cars = cars;
		this.introduction = introduction;
		this.createTime = createTime;
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

	@Column(name = "introduction", nullable = false)
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "createTime", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}