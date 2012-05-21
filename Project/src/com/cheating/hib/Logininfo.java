package com.cheating.hib;

import java.util.Set;

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
	public Logininfo(Authority authority, String loginName, String password,
			Set managerinfos, Set customerinfos, Set administratorinfos) {
		super(authority, loginName, password, managerinfos, customerinfos,
				administratorinfos);
	}

}
