package com.cheating.hib;

/**
 * Logininfo entity. @author MyEclipse Persistence Tools
 */
public class Logininfo extends AbstractLogininfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Logininfo() {
	}

	/** minimal constructor */
	public Logininfo(String loginName, String password) {
		super(loginName, password);
	}

	/** full constructor */
	public Logininfo(Customerinfo customerinfo, String loginName,
			String password) {
		super(customerinfo, loginName, password);
	}

}
