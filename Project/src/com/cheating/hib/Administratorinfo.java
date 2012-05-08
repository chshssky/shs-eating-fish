package com.cheating.hib;

/**
 * Administratorinfo entity. @author MyEclipse Persistence Tools
 */
public class Administratorinfo extends AbstractAdministratorinfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Administratorinfo() {
	}

	/** full constructor */
	public Administratorinfo(String loginName, String password) {
		super(loginName, password);
	}

}
