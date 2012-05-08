package com.cheating.hib;

/**
 * Managerinfo entity. @author MyEclipse Persistence Tools
 */
public class Managerinfo extends AbstractManagerinfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Managerinfo() {
	}

	/** minimal constructor */
	public Managerinfo(String loginName, String password) {
		super(loginName, password);
	}

	/** full constructor */
	public Managerinfo(Restaurantinfo restaurantinfo, String loginName,
			String password) {
		super(restaurantinfo, loginName, password);
	}

}
