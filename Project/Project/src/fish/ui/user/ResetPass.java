package fish.ui.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.SessionBean.LoginedUser;
import com.cheating.hib.Customerinfo;
import com.cheating.hib.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPass extends ActionSupport implements ServletRequestAware{
	private String new_pass ;
	private String renew_pass ;
	

	private String old_pass ;
	private HttpServletRequest request;
	
	public void validate() {
		LoginedUser currUser = (LoginedUser)request.getSession().getAttribute("currUser");
		Session se = HibernateSessionFactory.getSession();
		Customerinfo cu = new Customerinfo();
		cu = (Customerinfo)se.load(Customerinfo.class, currUser.getId());
		
		if(old_pass == null || old_pass.isEmpty())
		{
			this.addActionError("«Î ‰»Î–¬√‹¬Î") ;
		}
		
		if(!cu.getLogininfo().getPassword().equals(old_pass))
		{
			this.addActionError("æ…√‹¬Î¥ÌŒÛ") ;
		}
		
		if(new_pass == null || new_pass.isEmpty())
		{
			this.addActionError("«Î ‰»Î–¬√‹¬Î") ;
		}
		
		if(!new_pass.equals(renew_pass))
		{
			this.addActionError("¡Ω¥Œ√‹¬Î≤ª“ª÷¬") ;
		}
		HibernateSessionFactory.closeSession();
	}
	public String execute() throws Exception {
		System.out.println("execute");
		LoginedUser currUser = (LoginedUser)request.getSession().getAttribute("currUser");
		Session se = HibernateSessionFactory.getSession();
		Customerinfo cu = new Customerinfo();
		cu = (Customerinfo)se.load(Customerinfo.class, currUser.getId());	
		
		cu.getLogininfo().setPassword(new_pass);
		Transaction tran = se.beginTransaction();
		se.save(cu);
		tran.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS ;
	}
	
	public String getRenew_pass() {
		return renew_pass;
	}

	public void setRenew_pass(String renew_pass) {
		this.renew_pass = renew_pass;
	}
	
	public String getNew_pass() {
		return new_pass;
	}

	public void setNew_pass(String new_pass) {
		this.new_pass = new_pass;
	}

	public String getOld_pass() {
		return old_pass;
	}

	public void setOld_pass(String old_pass) {
		this.old_pass = old_pass;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request ;
	}
}
