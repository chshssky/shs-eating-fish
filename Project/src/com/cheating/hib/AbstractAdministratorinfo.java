package com.cheating.hib;

/**
 * AbstractAdministratorinfo entity provides the base persistence definition of
 * the Administratorinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAdministratorinfo implements java.io.Serializable {

	// Fields

	private Integer adId;
	private String loginName;
	private String password;

	// Constructors

	/** default constructor */
	public AbstractAdministratorinfo() {
	}

	/** full constructor */
	public AbstractAdministratorinfo(String loginName, String password) {
		this.loginName = loginName;
		this.password = password;
	}

	// Property accessors

	public Integer getAdId() {
		return this.adId;
	}

	public void setAdId(Integer adId) {
		this.adId = adId;
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