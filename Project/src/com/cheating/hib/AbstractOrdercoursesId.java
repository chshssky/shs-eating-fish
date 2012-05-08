package com.cheating.hib;

/**
 * AbstractOrdercoursesId entity provides the base persistence definition of the
 * OrdercoursesId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrdercoursesId implements java.io.Serializable {

	// Fields

	private Integer num;
	private Orderinfo orderinfo;
	private Courseinfo courseinfo;

	// Constructors

	/** default constructor */
	public AbstractOrdercoursesId() {
	}

	/** minimal constructor */
	public AbstractOrdercoursesId(Integer num) {
		this.num = num;
	}

	/** full constructor */
	public AbstractOrdercoursesId(Integer num, Orderinfo orderinfo,
			Courseinfo courseinfo) {
		this.num = num;
		this.orderinfo = orderinfo;
		this.courseinfo = courseinfo;
	}

	// Property accessors

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Orderinfo getOrderinfo() {
		return this.orderinfo;
	}

	public void setOrderinfo(Orderinfo orderinfo) {
		this.orderinfo = orderinfo;
	}

	public Courseinfo getCourseinfo() {
		return this.courseinfo;
	}

	public void setCourseinfo(Courseinfo courseinfo) {
		this.courseinfo = courseinfo;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractOrdercoursesId))
			return false;
		AbstractOrdercoursesId castOther = (AbstractOrdercoursesId) other;

		return ((this.getNum() == castOther.getNum()) || (this.getNum() != null
				&& castOther.getNum() != null && this.getNum().equals(
				castOther.getNum())))
				&& ((this.getOrderinfo() == castOther.getOrderinfo()) || (this
						.getOrderinfo() != null
						&& castOther.getOrderinfo() != null && this
						.getOrderinfo().equals(castOther.getOrderinfo())))
				&& ((this.getCourseinfo() == castOther.getCourseinfo()) || (this
						.getCourseinfo() != null
						&& castOther.getCourseinfo() != null && this
						.getCourseinfo().equals(castOther.getCourseinfo())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getNum() == null ? 0 : this.getNum().hashCode());
		result = 37 * result
				+ (getOrderinfo() == null ? 0 : this.getOrderinfo().hashCode());
		result = 37
				* result
				+ (getCourseinfo() == null ? 0 : this.getCourseinfo()
						.hashCode());
		return result;
	}

}