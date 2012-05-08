package com.cheating.hib;

import java.util.Set;

/**
 * Restaurantinfo entity. @author MyEclipse Persistence Tools
 */
public class Restaurantinfo extends AbstractRestaurantinfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Restaurantinfo() {
	}

	/** minimal constructor */
	public Restaurantinfo(String name, String address) {
		super(name, address);
	}

	/** full constructor */
	public Restaurantinfo(String name, String address, String descript,
			Integer managerUpBound, Set reservationinfos, Set managerinfos,
			Set courseinfos) {
		super(name, address, descript, managerUpBound, reservationinfos,
				managerinfos, courseinfos);
	}

}
