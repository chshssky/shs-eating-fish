package com.cheating.hib;

import java.util.Date;

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
	public Reservationinfo(Date orderTime) {
		super(orderTime);
	}

	/** full constructor */
	public Reservationinfo(Restaurantinfo restaurantinfo,
			Customerinfo customerinfo, Date orderTime, String state) {
		super(restaurantinfo, customerinfo, orderTime, state);
	}

}
