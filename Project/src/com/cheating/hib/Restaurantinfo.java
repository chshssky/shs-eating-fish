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
			Float latitude, Float longtitude, Integer managerUpBound,
			Set reservationinfos, Set managerinfos, Set courseinfos) {
		super(name, address, descript, latitude, longtitude, managerUpBound,
				reservationinfos, managerinfos, courseinfos);
	}

}
