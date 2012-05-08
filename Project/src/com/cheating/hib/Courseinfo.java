package com.cheating.hib;

import java.util.Set;

/**
 * Courseinfo entity. @author MyEclipse Persistence Tools
 */
public class Courseinfo extends AbstractCourseinfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Courseinfo() {
	}

	/** minimal constructor */
	public Courseinfo(String name, Integer price) {
		super(name, price);
	}

	/** full constructor */
	public Courseinfo(Restaurantinfo restaurantinfo, String name,
			String descript, Integer price, Set ordercourseses) {
		super(restaurantinfo, name, descript, price, ordercourseses);
	}

}
