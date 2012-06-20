package eating.man.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import com.opensymphony.xwork2.ActionSupport;

import com.cheating.hib.*; 

import org.hibernate.Criteria; 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;


public class deleteManagerA extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	private int managerID;
	private int loginID;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public int getManagerID() {
		return managerID;
	}

	public void setManagerID(int managerID) {
		this.managerID = managerID;
	}

	public int getLoginID() {
		return loginID;
	}

	public void setLoginID(int loginID) {
		this.loginID = loginID;
	}
	public void delete() throws IOException
	{
		Session se = HibernateSessionFactory.getSession();
		
		Managerinfo manager =(Managerinfo)se.load(Managerinfo.class, managerID);
		Logininfo login = (Logininfo)se.load(Logininfo.class, loginID);
		Transaction tx = se.beginTransaction();
		se.delete(login);
		se.delete(manager);
		tx.commit();
		se.close();
		response.sendRedirect("administratorOpe.jsp?id=-1");
	}
	
	public String execute() throws Exception
	{
		delete();
		return SUCCESS;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response ;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	

}
