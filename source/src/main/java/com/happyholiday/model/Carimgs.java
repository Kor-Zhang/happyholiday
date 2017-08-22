package com.happyholiday.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Carimgs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "carimgs", catalog = "happyholiday")
public class Carimgs implements java.io.Serializable {

	// Fields

	private String id;
	private Cars cars;
	private Imgs imgs;
	private Boolean main;

	// Constructors

	/** default constructor */
	public Carimgs() {
	}

	/** full constructor */
	public Carimgs(String id, Cars cars, Imgs imgs, Boolean main) {
		this.id = id;
		this.cars = cars;
		this.imgs = imgs;
		this.main = main;
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
	@JoinColumn(name = "imgId", nullable = false)
	public Imgs getImgs() {
		return this.imgs;
	}

	public void setImgs(Imgs imgs) {
		this.imgs = imgs;
	}

	@Column(name = "main", nullable = false)
	public Boolean getMain() {
		return this.main;
	}

	public void setMain(Boolean main) {
		this.main = main;
	}

}