package com.cheating.hib;

import java.util.Set;


/**
 * Courseinfo entity. @author MyEclipse Persistence Tools
 */
public class Courseinfo extends AbstractCourseinfo implements java.io.Serializable {

    // Constructors

    /** default constructor */
    public Courseinfo() {
    }

	/** minimal constructor */
    public Courseinfo(String name, Integer price) {
        super(name, price);        
    }
    
    /** full constructor */
    public Courseinfo(Restaurantinfo restaurantinfo, Coursetype coursetype, String name, String descript, Integer price, String pic, Set ordercourseses) {
        super(restaurantinfo, coursetype, name, descript, price, pic, ordercourseses);        
    }
   
}
