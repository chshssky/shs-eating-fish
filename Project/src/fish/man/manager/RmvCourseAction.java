package fish.man.manager;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class RmvCourseAction extends ActionSupport implements ServletRequestAware {
	private int courseID ;

	private HttpServletRequest request ;
	
	private void rmv()
	{
		Session se = HibernateSessionFactory.getSession() ;
		Courseinfo cur = (Courseinfo) se.load(Courseinfo.class, courseID) ;
		Transaction tran = se.beginTransaction() ;
		tran.begin() ;
		se.delete(cur) ;
		tran.commit() ;
		HibernateSessionFactory.closeSession() ;
	}

	public String execute() throws Exception {
		rmv() ;
		request.getSession().setAttribute("rmvSuc", "É¾³ý³É¹¦") ;
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
