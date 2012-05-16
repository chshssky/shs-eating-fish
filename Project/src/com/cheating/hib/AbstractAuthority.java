package com.cheating.hib;

import java.util.HashSet;
import java.util.Set;


/**
 * AbstractAuthority entity provides the base persistence definition of the Authority entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAuthority  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String authorName;
     private Set logininfos = new HashSet(0);


    // Constructors

    /** default constructor */
    public AbstractAuthority() {
    }

	/** minimal constructor */
    public AbstractAuthority(String authorName) {
        this.authorName = authorName;
    }
    
    /** full constructor */
    public AbstractAuthority(String authorName, Set logininfos) {
        this.authorName = authorName;
        this.logininfos = logininfos;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getAuthorName() {
        return this.authorName;
    }
    
    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Set getLogininfos() {
        return this.logininfos;
    }
    
    public void setLogininfos(Set logininfos) {
        this.logininfos = logininfos;
    }
   








}