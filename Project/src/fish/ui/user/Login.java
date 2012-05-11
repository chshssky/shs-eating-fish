package fish.ui.user;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cheating.SessionBean.*;
import com.cheating.hib.*;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import sun.org.mozilla.javascript.internal.Context;

public class Login extends ActionSupport implements ServletRequestAware, ServletResponseAware {
	private String loginName;
	private String password;
	private LoginedUser currUser;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public LoginedUser getCurrUser() {
		return currUser;
	}
	public void setCurrUser(LoginedUser currUser) {
		this.currUser = currUser;
	}
	public void validate() {
		currUser = (LoginedUser)request.getSession().getAttribute("currUser");
		Session se = HibernateSessionFactory.getSession();
		Criteria crit = se.createCriteria(Logininfo.class);
		//crit.add(Restrictions.eq("loginName", loginName));
		List<Logininfo> infos = crit.list();
		
		boolean login = false;
		for(Logininfo info:infos) {
			if(loginName.equals(info.getLoginName())) {
				if(password.equals(info.getPassword())) {
					System.out.println("Login_Action:LoginID:" + info.getLoginId());
					currUser.setId(info.getCustomerinfo().getCustomerId());
					currUser.setFirstname(info.getCustomerinfo().getFirstName());
					login = true;
					request.getSession().setAttribute("currUser", currUser);
					break;
				}
			}			
		}
		if(!login) {
			this.addActionError("用户名或密码错误!");
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}
}
