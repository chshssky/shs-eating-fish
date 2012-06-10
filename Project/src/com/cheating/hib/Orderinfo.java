package com.cheating.hib;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Orderinfo entity. @author MyEclipse Persistence Tools
 */
public class Orderinfo extends AbstractOrderinfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Orderinfo() {
	}

	/** minimal constructor */
	public Orderinfo(String address) {
		super(address);
	}

	/** full constructor */
	public Orderinfo(Customerinfo customerinfo, String address,
			String telephoneNum, String firstName, String lastName,
			Integer sumPrice, Timestamp orderTime, Timestamp demandTime,
			String state, Set ordercourseses) {
		super(customerinfo, address, telephoneNum, firstName, lastName,
				sumPrice, orderTime, demandTime, state, ordercourseses);
	}

}
