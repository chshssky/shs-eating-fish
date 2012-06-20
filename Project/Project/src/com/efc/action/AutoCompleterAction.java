package com.efc.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class AutoCompleterAction extends ActionSupport {
	private List<String> courses=new ArrayList<String>();
	private String myCourse;
	private String option;

	public AutoCompleterAction(){
		courses.add("Spring MVC");
		courses.add("Struts 1.x");
		if (option.equals("rest"))
			courses.add("Struts 2.x");
		courses.add("JavaServer Faces (JSF)");
		courses.add("Google Web Toolkit (GWT)");
		courses.add("Apache Wicket");
		courses.add("Apache Click");
		courses.add("Apache Cocoon");
		courses.add("JBoss Seam");
		courses.add("Stripes");
		courses.add("Apache Tapestry");
		courses.add("Others");
	}

	public List<String> getCourses() {
		return courses;
	}

	public void setCourses(List<String> courses) {
		this.courses = courses;
	}

	public String getMyCourse() {
		return myCourse;
	}

	public void setMyCourse(String myCourse) {
		this.myCourse = myCourse;
	}
	public String display() {
		return NONE;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}	
 
}
