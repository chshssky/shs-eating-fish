package com.cheating.hib;

import java.util.Set;

/**
 * Coursetype entity. @author MyEclipse Persistence Tools
 */
public class Coursetype extends AbstractCoursetype implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Coursetype() {
	}

	/** minimal constructor */
	public Coursetype(String typeName) {
		super(typeName);
	}

	/** full constructor */
	public Coursetype(String typeName, Set courseinfos) {
		super(typeName, courseinfos);
	}

}
