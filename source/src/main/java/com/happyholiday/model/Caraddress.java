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

/**
 * Caraddress entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "caraddress", catalog = "happyholiday")
public class Caraddress implements java.io.Serializable {

	// Fields

	private String id;
	private Caraddress caraddress;
	private String address;
	private Set<Caraddress> caraddresses = new HashSet<Caraddress>(0);

	// Constructors

	/** default constructor */
	public Caraddress() {
	}

	/** minimal constructor */
	public Caraddress(String id, String address) {
		this.id = id;
		this.address = address;
	}

	/** full constructor */
	public Caraddress(String id, Caraddress caraddress, String address,
			Set<Caraddress> caraddresses) {
		this.id = id;
		this.caraddress = caraddress;
		this.address = address;
		this.caraddresses = caraddresses;
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
	@JoinColumn(name = "pId")
	public Caraddress getCaraddress() {
		return this.caraddress;
	}

	public void setCaraddress(Caraddress caraddress) {
		this.caraddress = caraddress;
	}

	@Column(name = "address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "caraddress")
	public Set<Caraddress> getCaraddresses() {
		return this.caraddresses;
	}

	public void setCaraddresses(Set<Caraddress> caraddresses) {
		this.caraddresses = caraddresses;
	}

}