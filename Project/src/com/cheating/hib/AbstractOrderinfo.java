package com.cheating.hib;

import java.sql.Timestamp;
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
	private String telephoneNum;
	private String firstName;
	private String lastName;
	private Integer sumPrice;
	private Timestamp orderTime;
	private Timestamp demandTime;
	private String state;
	private Set ordercourseses = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractOrderinfo() {
	}

	/** minimal constructor */
	public AbstractOrderinfo(String address) {
		this.address = address;
	}

	/** full constructor */
	public AbstractOrderinfo(Customerinfo customerinfo, String address,
			String telephoneNum, String firstName, String lastName,
			Integer sumPrice, Timestamp orderTime, Timestamp demandTime,
			String state, Set ordercourseses) {
		this.customerinfo = customerinfo;
		this.address = address;
		this.telephoneNum = telephoneNum;
		this.firstName = firstName;
		this.lastName = lastName;
		this.sumPrice = sumPrice;
		this.orderTime = orderTime;
		this.demandTime = demandTime;
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

	public String getTelephoneNum() {
		return this.telephoneNum;
	}

	public void setTelephoneNum(String telephoneNum) {
		this.telephoneNum = telephoneNum;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Integer getSumPrice() {
		return this.sumPrice;
	}

	public void setSumPrice(Integer sumPrice) {
		this.sumPrice = sumPrice;
	}

	public Timestamp getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public Timestamp getDemandTime() {
		return this.demandTime;
	}

	public void setDemandTime(Timestamp demandTime) {
		this.demandTime = demandTime;
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