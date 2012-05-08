package com.cheating.hib;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractCustomerinfo entity provides the base persistence definition of the
 * Customerinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCustomerinfo implements java.io.Serializable {

	// Fields

	private Integer customerId;
	private Integer telephoneNum;
	private String firstName;
	private String lastName;
	private String email;
	private Set reservationinfos = new HashSet(0);
	private Set logininfos = new HashSet(0);
	private Set orderinfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractCustomerinfo() {
	}

	/** minimal constructor */
	public AbstractCustomerinfo(String lastName) {
		this.lastName = lastName;
	}

	/** full constructor */
	public AbstractCustomerinfo(Integer telephoneNum, String firstName,
			String lastName, String email, Set reservationinfos,
			Set logininfos, Set orderinfos) {
		this.telephoneNum = telephoneNum;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.reservationinfos = reservationinfos;
		this.logininfos = logininfos;
		this.orderinfos = orderinfos;
	}

	// Property accessors

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getTelephoneNum() {
		return this.telephoneNum;
	}

	public void setTelephoneNum(Integer telephoneNum) {
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

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getReservationinfos() {
		return this.reservationinfos;
	}

	public void setReservationinfos(Set reservationinfos) {
		this.reservationinfos = reservationinfos;
	}

	public Set getLogininfos() {
		return this.logininfos;
	}

	public void setLogininfos(Set logininfos) {
		this.logininfos = logininfos;
	}

	public Set getOrderinfos() {
		return this.orderinfos;
	}

	public void setOrderinfos(Set orderinfos) {
		this.orderinfos = orderinfos;
	}

}