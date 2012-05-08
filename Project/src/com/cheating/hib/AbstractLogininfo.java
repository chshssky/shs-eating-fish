package com.cheating.hib;

/**
 * AbstractLogininfo entity provides the base persistence definition of the
 * Logininfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractLogininfo implements java.io.Serializable {

	// Fields

	private Integer loginId;
	private Customerinfo customerinfo;
	private String loginName;
	private String password;

	// Constructors

	/** default constructor */
	public AbstractLogininfo() {
	}

	/** minimal constructor */
	public AbstractLogininfo(String loginName, String password) {
		this.loginName = loginName;
		this.password = password;
	}

	/** full constructor */
	public AbstractLogininfo(Customerinfo customerinfo, String loginName,
			String password) {
		this.customerinfo = customerinfo;
		this.loginName = loginName;
		this.password = password;
	}

	// Property accessors

	public Integer getLoginId() {
		return this.loginId;
	}

	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}

	public Customerinfo getCustomerinfo() {
		return this.customerinfo;
	}

	public void setCustomerinfo(Customerinfo customerinfo) {
		this.customerinfo = customerinfo;
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