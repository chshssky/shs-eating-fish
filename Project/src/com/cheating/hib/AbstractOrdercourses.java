package com.cheating.hib;

/**
 * AbstractOrdercourses entity provides the base persistence definition of the
 * Ordercourses entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrdercourses implements java.io.Serializable {

	// Fields

	private OrdercoursesId id;
	private Courseinfo courseinfo;
	private Orderinfo orderinfo;

	// Constructors

	/** default constructor */
	public AbstractOrdercourses() {
	}

	/** minimal constructor */
	public AbstractOrdercourses(OrdercoursesId id) {
		this.id = id;
	}

	/** full constructor */
	public AbstractOrdercourses(OrdercoursesId id, Courseinfo courseinfo,
			Orderinfo orderinfo) {
		this.id = id;
		this.courseinfo = courseinfo;
		this.orderinfo = orderinfo;
	}

	// Property accessors

	public OrdercoursesId getId() {
		return this.id;
	}

	public void setId(OrdercoursesId id) {
		this.id = id;
	}

	public Courseinfo getCourseinfo() {
		return this.courseinfo;
	}

	public void setCourseinfo(Courseinfo courseinfo) {
		this.courseinfo = courseinfo;
	}

	public Orderinfo getOrderinfo() {
		return this.orderinfo;
	}

	public void setOrderinfo(Orderinfo orderinfo) {
		this.orderinfo = orderinfo;
	}

}