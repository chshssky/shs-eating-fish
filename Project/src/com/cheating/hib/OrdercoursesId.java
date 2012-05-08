package com.cheating.hib;

/**
 * OrdercoursesId entity. @author MyEclipse Persistence Tools
 */
public class OrdercoursesId extends AbstractOrdercoursesId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public OrdercoursesId() {
	}

	/** minimal constructor */
	public OrdercoursesId(Integer num) {
		super(num);
	}

	/** full constructor */
	public OrdercoursesId(Integer num, Orderinfo orderinfo,
			Courseinfo courseinfo) {
		super(num, orderinfo, courseinfo);
	}

}
