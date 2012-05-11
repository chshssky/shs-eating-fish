package fish.operation.cart;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class PutCart extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	//Cart mycart ;
	
	private int id ;
	private int course_count ;
	private Item course ;
	
	private HttpServletRequest request;
	
	public Item getCourse() {
		return course;
	}

	public void setCourse(Item course) {
		this.course = course;
	}


	public void put()
	{
		course = new Item() ;
		if(course_count == 0)
			course_count = 1 ;
		course.setCourse_id(id) ;
		course.setCourse_num(course_count) ;
		
		Login.getMycart().getCart().add(course) ;
		
		request.getSession().setAttribute("mycart", Login.getMycart()) ;
		
		
	}
	
	
	@Override
	public String execute() throws Exception {
		if(request.getSession().getAttribute("currUser") == null)
		{
			JOptionPane.showMessageDialog(null, "ÇëÏÈµÇÂ¼") ;
			return INPUT;
		}
		
		put() ;
		return SUCCESS;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getCourse_count() {
		return course_count;
	}


	public void setCourse_count(int course_count) {
		this.course_count = course_count;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		
	}
	
}
