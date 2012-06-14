package fish.ui.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.SessionBean.LoginedUser;
import com.cheating.hib.*;
import com.opensymphony.xwork2.ActionSupport;

public class ResetEmail extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	private String newEmail ;
	private HttpServletResponse response;
	private HttpServletRequest request;
	private LoginedUser currUser;	

	public void writeEmail() {
		
		currUser = (LoginedUser)request.getSession().getAttribute("currUser");
		Session se = HibernateSessionFactory.getSession();
		Customerinfo cu = new Customerinfo();
		cu = (Customerinfo)se.load(Customerinfo.class, currUser.getId());
		
		cu.setEmail(newEmail);
		Transaction tran = se.beginTransaction();
		se.save(cu);
		tran.commit();
		HibernateSessionFactory.closeSession();		
		
	}
	
	public void validate() {
		System.out.println("nihao!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(""+newEmail);
		writeEmail();
		this.addActionError("yonghu");
	}
	public String getNewEmail() {
		return newEmail;
	}
	public void setNewEmail(String newEmail) {
		this.newEmail = newEmail;
	}
	public LoginedUser getCurrUser() {
		return currUser;
	}
	public void setCurrUser(LoginedUser currUser) {
		this.currUser = currUser;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = request;
	}
}
