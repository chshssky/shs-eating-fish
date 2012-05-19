package com.cheating.hib;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractRestaurantinfo entity provides the base persistence definition of the
 * Restaurantinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractRestaurantinfo implements java.io.Serializable {

	// Fields

	private Integer restaurantId;
	private String name;
	private String address;
	private String descript;
	private Integer managerUpBound;
	private Set reservationinfos = new HashSet(0);
	private Set managerinfos = new HashSet(0);
	private Set courseinfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractRestaurantinfo() {
	}

	/** minimal constructor */
	public AbstractRestaurantinfo(String name, String address) {
		this.name = name;
		this.address = address;
	}

	/** full constructor */
	public AbstractRestaurantinfo(String name, String address, String descript,
			Integer managerUpBound, Set reservationinfos, Set managerinfos,
			Set courseinfos) {
		this.name = name;
		this.address = address;
		this.descript = descript;
		this.managerUpBound = managerUpBound;
		this.reservationinfos = reservationinfos;
		this.managerinfos = managerinfos;
		this.courseinfos = courseinfos;
	}

	// Property accessors

	public Integer getRestaurantId() {
		return this.restaurantId;
	}

	public void setRestaurantId(Integer restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescript() {
		return this.descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Integer getManagerUpBound() {
		return this.managerUpBound;
	}

	public void setManagerUpBound(Integer managerUpBound) {
		this.managerUpBound = managerUpBound;
	}

	public Set getReservationinfos() {
		return this.reservationinfos;
	}

	public void setReservationinfos(Set reservationinfos) {
		this.reservationinfos = reservationinfos;
	}

	public Set getManagerinfos() {
		return this.managerinfos;
	}

	public void setManagerinfos(Set managerinfos) {
		this.managerinfos = managerinfos;
	}

	public Set getCourseinfos() {
		return this.courseinfos;
	}

	public void setCourseinfos(Set courseinfos) {
		this.courseinfos = courseinfos;
	}

}