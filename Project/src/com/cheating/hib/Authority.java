package com.cheating.hib;

import java.util.Set;

/**
 * Authority entity. @author MyEclipse Persistence Tools
 */
public class Authority extends AbstractAuthority implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Authority() {
	}

	/** minimal constructor */
	public Authority(String authorName) {
		super(authorName);
	}

	/** full constructor */
	public Authority(String authorName, Set logininfos) {
		super(authorName, logininfos);
	}

}
