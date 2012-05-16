package com.cheating.hib;



/**
 * Ordercourses entity. @author MyEclipse Persistence Tools
 */
public class Ordercourses extends AbstractOrdercourses implements java.io.Serializable {

    // Constructors

    /** default constructor */
    public Ordercourses() {
    }

	/** minimal constructor */
    public Ordercourses(Integer num) {
        super(num);        
    }
    
    /** full constructor */
    public Ordercourses(Courseinfo courseinfo, Orderinfo orderinfo, Integer num) {
        super(courseinfo, orderinfo, num);        
    }
   
}
