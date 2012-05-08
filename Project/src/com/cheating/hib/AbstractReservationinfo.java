package com.cheating.hib;

import java.util.Date;

/**
 * AbstractReservationinfo entity provides the base persistence definition of
 * the Reservationinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractReservationinfo implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Restaurantinfo restaurantinfo;
	private Customerinfo customerinfo;
	private Date orderTime;
	private String state;

	// Constructors

	/** default constructor */
	public AbstractReservationinfo() {
	}

	/** minimal constructor */
	public AbstractReservationinfo(Date orderTime) {
		this.orderTime = orderTime;
	}

	/** full constructor */
	public AbstractReservationinfo(Restaurantinfo restaurantinfo,
			Customerinfo customerinfo, Date orderTime, String state) {
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

	public Date getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}