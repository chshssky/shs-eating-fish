package com.cheating.hib;

import java.sql.Timestamp;

/**
 * Reservationinfo entity. @author MyEclipse Persistence Tools
 */
public class Reservationinfo extends AbstractReservationinfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Reservationinfo() {
	}

	/** minimal constructor */
	public Reservationinfo(Timestamp orderTime) {
		super(orderTime);
	}

	/** full constructor */
	public Reservationinfo(Restaurantinfo restaurantinfo,
			Customerinfo customerinfo, Timestamp orderTime, String state) {
		super(restaurantinfo, customerinfo, orderTime, state);
	}

}
