package com.cheating.hib;

import java.sql.Timestamp;

/**
 * AbstractReservationinfo entity provides the base persistence definition of
 * the Reservationinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractReservationinfo implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Restaurantinfo restaurantinfo;
	private Customerinfo customerinfo;
	private Timestamp orderTime;
	private String state;

	// Constructors

	/** default constructor */
	public AbstractReservationinfo() {
	}

	/** minimal constructor */
	public AbstractReservationinfo(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	/** full constructor */
	public AbstractReservationinfo(Restaurantinfo restaurantinfo,
			Customerinfo customerinfo, Timestamp orderTime, String state) {
		this.restaurantinfo = restaurantinfo;
		this.customerinfo = customerinfo;
		this.orderTime = orderTime;
		this.state = state;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Restaurantinfo getRestaurantinfo() {
		return this.restaurantinfo;
	}

	public void setRestaurantinfo(Restaurantinfo restaurantinfo) {
		this.restaurantinfo = restaurantinfo;
	}

	public Customerinfo getCustomerinfo() {
		return this.customerinfo;
	}

	public void setCustomerinfo(Customerinfo customerinfo) {
		this.customerinfo = customerinfo;
	}

	public Timestamp getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}