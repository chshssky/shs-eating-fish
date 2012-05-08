package com.cheating.hib;

/**
 * AbstractManagerinfo entity provides the base persistence definition of the
 * Managerinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractManagerinfo implements java.io.Serializable {

	// Fields

	private Integer managerId;
	private Restaurantinfo restaurantinfo;
	private String loginName;
	private String password;

	// Constructors

	/** default constructor */
	public AbstractManagerinfo() {
	}

	/** minimal constructor */
	public AbstractManagerinfo(String loginName, String password) {
		this.loginName = loginName;
		this.password = password;
	}

	/** full constructor */
	public AbstractManagerinfo(Restaurantinfo restaurantinfo, String loginName,
			String password) {
		this.restaurantinfo = restaurantinfo;
		this.loginName = loginName;
		this.password = password;
	}

	// Property accessors

	public Integer getManagerId() {
		return this.managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}

	public Restaurantinfo getRestaurantinfo() {
		return this.restaurantinfo;
	}

	public void setRestaurantinfo(Restaurantinfo restaurantinfo) {
		this.restaurantinfo = restaurantinfo;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}