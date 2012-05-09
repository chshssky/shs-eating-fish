package com.cheating.hib;

/**
 * AbstractOrdercourses entity provides the base persistence definition of the
 * Ordercourses entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrdercourses implements java.io.Serializable {

	// Fields

	private Integer orderCoursesId;
	private Courseinfo courseinfo;
	private Orderinfo orderinfo;
	private Integer num;

	// Constructors

	/** default constructor */
	public AbstractOrdercourses() {
	}

	/** minimal constructor */
	public AbstractOrdercourses(Integer num) {
		this.num = num;
	}

	/** full constructor */
	public AbstractOrdercourses(Courseinfo courseinfo, Orderinfo orderinfo,
			Integer num) {
		this.courseinfo = courseinfo;
		this.orderinfo = orderinfo;
		this.num = num;
	}

	// Property accessors

	public Integer getOrderCoursesId() {
		return this.orderCoursesId;
	}

	public void setOrderCoursesId(Integer orderCoursesId) {
		this.orderCoursesId = orderCoursesId;
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

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}