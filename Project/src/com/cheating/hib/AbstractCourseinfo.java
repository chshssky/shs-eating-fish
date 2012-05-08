package com.cheating.hib;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractCourseinfo entity provides the base persistence definition of the
 * Courseinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCourseinfo implements java.io.Serializable {

	// Fields

	private Integer courseId;
	private Restaurantinfo restaurantinfo;
	private String name;
	private String descript;
	private Integer price;
	private Set ordercourseses = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractCourseinfo() {
	}

	/** minimal constructor */
	public AbstractCourseinfo(String name, Integer price) {
		this.name = name;
		this.price = price;
	}

	/** full constructor */
	public AbstractCourseinfo(Restaurantinfo restaurantinfo, String name,
			String descript, Integer price, Set ordercourseses) {
		this.restaurantinfo = restaurantinfo;
		this.name = name;
		this.descript = descript;
		this.price = price;
		this.ordercourseses = ordercourseses;
	}

	// Property accessors

	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Restaurantinfo getRestaurantinfo() {
		return this.restaurantinfo;
	}

	public void setRestaurantinfo(Restaurantinfo restaurantinfo) {
		this.restaurantinfo = restaurantinfo;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescript() {
		return this.descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Set getOrdercourseses() {
		return this.ordercourseses;
	}

	public void setOrdercourseses(Set ordercourseses) {
		this.ordercourseses = ordercourseses;
	}

}