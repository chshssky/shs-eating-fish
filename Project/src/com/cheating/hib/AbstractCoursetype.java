package com.cheating.hib;

import java.util.HashSet;
import java.util.Set;


/**
 * AbstractCoursetype entity provides the base persistence definition of the Coursetype entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCoursetype  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String typeName;
     private Set courseinfos = new HashSet(0);


    // Constructors

    /** default constructor */
    public AbstractCoursetype() {
    }

	/** minimal constructor */
    public AbstractCoursetype(String typeName) {
        this.typeName = typeName;
    }
    
    /** full constructor */
    public AbstractCoursetype(String typeName, Set courseinfos) {
        this.typeName = typeName;
        this.courseinfos = courseinfos;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Set getCourseinfos() {
        return this.courseinfos;
    }
    
    public void setCourseinfos(Set courseinfos) {
        this.courseinfos = courseinfos;
    }
   








}