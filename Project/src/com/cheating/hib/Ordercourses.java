package com.cheating.hib;

/**
 * Ordercourses entity. @author MyEclipse Persistence Tools
 */
public class Ordercourses extends AbstractOrdercourses implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Ordercourses() {
	}

	/** minimal constructor */
	public Ordercourses(OrdercoursesId id) {
		super(id);
	}

	/** full constructor */
	public Ordercourses(OrdercoursesId id, Courseinfo courseinfo,
			Orderinfo orderinfo) {
		super(id, courseinfo, orderinfo);
	}

}
