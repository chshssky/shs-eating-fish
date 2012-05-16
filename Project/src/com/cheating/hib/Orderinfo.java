package com.cheating.hib;

import java.sql.Timestamp;
import java.util.Set;


/**
 * Orderinfo entity. @author MyEclipse Persistence Tools
 */
public class Orderinfo extends AbstractOrderinfo implements java.io.Serializable {

    // Constructors

    /** default constructor */
    public Orderinfo() {
    }

	/** minimal constructor */
    public Orderinfo(String address, Timestamp orderTime) {
        super(address, orderTime);        
    }
    
    /** full constructor */
    public Orderinfo(Customerinfo customerinfo, String address, Integer sumPrice, Timestamp orderTime, String state, Set ordercourseses) {
        super(customerinfo, address, sumPrice, orderTime, state, ordercourseses);        
    }
   
}
