package com.cheating.hib;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractOrderinfo entity provides the base persistence definition of the
 * Orderinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrderinfo implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Customerinfo customerinfo;
	private String address;
	private Integer sumPrice;
	private Date orderTime;
	private String state;
	private Set ordercourseses = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractOrderinfo() {
	}

	/** minimal constructor */
	public AbstractOrderinfo(String address, Date orderTime) {
		this.address = address;
		this.orderTime = orderTime;
	}

	/** full constructor */
	public AbstractOrderinfo(Customerinfo customerinfo, String address,
			Integer sumPrice, Date orderTime, String state, Set ordercourseses) {
		this.customerinfo = customerinfo;
		this.address = address;
		this.sumPrice = sumPrice;
		this.orderTime = orderTime;
		this.state = state;
		this.ordercourseses = ordercourseses;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Customerinfo getCustomerinfo() {
		return this.customerinfo;
	}

	public void setCustomerinfo(Customerinfo customerinfo) {
		this.customerinfo = customerinfo;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getSumPrice() {
		return this.sumPrice;
	}

	public void setSumPrice(Integer sumPrice) {
		this.sumPrice = sumPrice;
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

	public Set getOrdercourseses() {
		return this.ordercourseses;
	}

	public void setOrdercourseses(Set ordercourseses) {
		this.ordercourseses = ordercourseses;
	}

}