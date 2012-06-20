package fish.man.manager;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Logininfo;
import com.cheating.hib.Managerinfo;
import com.opensymphony.xwork2.ActionSupport;

public class ManinfoAction extends ActionSupport implements ServletRequestAware {
	private String oldPass ;
	private String newPass ;
	private String renewPass ;

	HttpServletRequest request ;
	
	private boolean modify() {
		Managerinfo curMan = (Managerinfo) request.getSession().getAttribute("curManager") ;
		Logininfo loginfo = curMan.getLogininfo() ;
		
		if(oldPass != null && !oldPass.isEmpty())
		{
			if(oldPass.equals(loginfo.getPassword()))
			{
				if(newPass != null && !oldPass.isEmpty() && newPass.equals(renewPass))
				{
					loginfo.setPassword(newPass) ;
					Session se = HibernateSessionFactory.getSession() ;
					Transaction tran = se.beginTransaction() ;
					se.update(loginfo) ;
					tran.commit() ;
					
					return true ;
				}
				
				else
				{
					request.getSession().setAttribute("maninfoError", "–¬√‹¬Î≤ª∆•≈‰") ;
					return false ;
				}
					
			}
			else
			{
				request.getSession().setAttribute("maninfoError", "√‹¬Î¥ÌŒÛ") ;
				return false ;
			}
		}
		
		return false ;
	}
	
	public String execute() throws Exception {
		if(modify())
			return SUCCESS ;
		
		else return INPUT ;
	}
	
	public String getOldPass() {
		return oldPass;
	}
	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}
	public String getNewPass() {
		return newPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	
	public String getRenewPass() {
		return renewPass;
	}

	public void setRenewPass(String renewPass) {
		this.renewPass = renewPass;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
	}
}
