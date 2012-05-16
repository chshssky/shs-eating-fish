package com.cheating.hib;



/**
 * Managerinfo entity. @author MyEclipse Persistence Tools
 */
public class Managerinfo extends AbstractManagerinfo implements java.io.Serializable {

    // Constructors

    /** default constructor */
    public Managerinfo() {
    }

    
    /** full constructor */
    public Managerinfo(Restaurantinfo restaurantinfo, Logininfo logininfo, String name) {
        super(restaurantinfo, logininfo, name);        
    }
   
}
