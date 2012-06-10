package eating.man.administrator;

import java.io.IOException;
import java.util.List;

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

public class deleteManagerB extends ActionSupport implements ServletRequestAware, ServletResponseAware
{
	private String loginName;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public void delete() throws IOException
	{
		Session se = HibernateSessionFactory.getSession();
		Criteria crit2 = se.createCriteria(Logininfo.class);
		crit2.add(Restrictions.eq("loginName", loginName));
		List<Logininfo> logininfo = crit2.list();
		if(logininfo.isEmpty())
			response.sendRedirect("deleteManagerB.jsp?id=0");
		else
		{
			int loginID = logininfo.get(0).getLoginId();
			response.sendRedirect("deleteManagerB.jsp?id="+loginID);
		}
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
