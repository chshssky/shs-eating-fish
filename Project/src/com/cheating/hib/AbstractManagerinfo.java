package com.cheating.hib;



/**
 * AbstractManagerinfo entity provides the base persistence definition of the Managerinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractManagerinfo  implements java.io.Serializable {


    // Fields    

     private Integer managerId;
     private Restaurantinfo restaurantinfo;
     private Logininfo logininfo;
     private String name;


    // Constructors

    /** default constructor */
    public AbstractManagerinfo() {
    }

    
    /** full constructor */
    public AbstractManagerinfo(Restaurantinfo restaurantinfo, Logininfo logininfo, String name) {
        this.restaurantinfo = restaurantinfo;
        this.logininfo = logininfo;
        this.name = name;
    }

   
    // Property accessors

    public Integer getManagerId() {
        return this.managerId;
    }
    
    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public Restaurantinfo getRestaurantinfo() {
        return this.restaurantinfo;
    }
    
    public void setRestaurantinfo(Restaurantinfo restaurantinfo) {
        this.restaurantinfo = restaurantinfo;
    }

    public Logininfo getLogininfo() {
        return this.logininfo;
    }
    
    public void setLogininfo(Logininfo logininfo) {
        this.logininfo = logininfo;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
   








}