package com.cheating.hib;



/**
 * AbstractAdministratorinfo entity provides the base persistence definition of the Administratorinfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAdministratorinfo  implements java.io.Serializable {


    // Fields    

     private Integer adId;
     private Logininfo logininfo;
     private String name;


    // Constructors

    /** default constructor */
    public AbstractAdministratorinfo() {
    }

    
    /** full constructor */
    public AbstractAdministratorinfo(Logininfo logininfo, String name) {
        this.logininfo = logininfo;
        this.name = name;
    }

   
    // Property accessors

    public Integer getAdId() {
        return this.adId;
    }
    
    public void setAdId(Integer adId) {
        this.adId = adId;
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