package eating.man.administrator;

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


public class acknowledgeDelete extends ActionSupport implements ServletRequestAware, ServletResponseAware{
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
	public void delete()
	{
		Session se = HibernateSessionFactory.getSession();
		
		Managerinfo manager =(Managerinfo)se.load(Managerinfo.class, managerID);
		Logininfo login = (Logininfo)se.load(Logininfo.class, loginID);
		Transaction tx = se.beginTransaction();
		se.delete(login);
		se.delete(manager);
		tx.commit();

		System.out.println(managerID);
		System.out.println(loginID);
		se.close();
	}
	
	public String execute() throws Exception
	{
		delete();
		return SUCCESS;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = response ;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	

}
