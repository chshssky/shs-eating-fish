package com.cheating.hib;

import java.util.HashSet;
import java.util.Set;


/**
 * AbstractLogininfo entity provides the base persistence definition of the Logininfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractLogininfo  implements java.io.Serializable {


    // Fields    

     private Integer loginId;
     private Authority authority;
     private String loginName;
     private String password;
     private Set managerinfos = new HashSet(0);
     private Set customerinfos = new HashSet(0);
     private Set administratorinfos = new HashSet(0);


    // Constructors

    /** default constructor */
    public AbstractLogininfo() {
    }

	/** minimal constructor */
    public AbstractLogininfo(String loginName, String password) {
        this.loginName = loginName;
        this.password = password;
    }
    
    /** full constructor */
    public AbstractLogininfo(Authority authority, String loginName, String password, Set managerinfos, Set customerinfos, Set administratorinfos) {
        this.authority = authority;
        this.loginName = loginName;
        this.password = password;
        this.managerinfos = managerinfos;
        this.customerinfos = customerinfos;
        this.administratorinfos = administratorinfos;
    }

   
    // Property accessors

    public Integer getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public Authority getAuthority() {
        return this.authority;
    }
    
    public void setAuthority(Authority authority) {
        this.authority = authority;
    }

    public String getLoginName() {
        return this.loginName;
    }
    
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public Set getManagerinfos() {
        return this.managerinfos;
    }
    
    public void setManagerinfos(Set managerinfos) {
        this.managerinfos = managerinfos;
    }

    public Set getCustomerinfos() {
        return this.customerinfos;
    }
    
    public void setCustomerinfos(Set customerinfos) {
        this.customerinfos = customerinfos;
    }

    public Set getAdministratorinfos() {
        return this.administratorinfos;
    }
    
    public void setAdministratorinfos(Set administratorinfos) {
        this.administratorinfos = administratorinfos;
    }
   








}