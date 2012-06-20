package fish.man.manager;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class PostIdAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request ;
	private int courseID ;

	public String execute() throws Exception {
		request.getSession().setAttribute("courseID", courseID) ;
		return SUCCESS ;
	}

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;		
	}
}
