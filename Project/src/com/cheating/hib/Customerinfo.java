package com.cheating.hib;

import java.util.Set;

/**
 * Customerinfo entity. @author MyEclipse Persistence Tools
 */
public class Customerinfo extends AbstractCustomerinfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Customerinfo() {
	}

	/** minimal constructor */
	public Customerinfo(String lastName) {
		super(lastName);
	}

	/** full constructor */
	public Customerinfo(Logininfo logininfo, String telephoneNum,
			String firstName, String lastName, String email,
			Set reservationinfos, Set orderinfos) {
		super(logininfo, telephoneNum, firstName, lastName, email,
				reservationinfos, orderinfos);
	}

}
