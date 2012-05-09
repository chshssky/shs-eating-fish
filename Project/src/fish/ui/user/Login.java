package fish.ui.user;
import java.util.List;

import com.cheating.SessionBean.*;
import com.cheating.hib.*;
import com.opensymphony.xwork2.ActionSupport;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class Login extends ActionSupport{
	String loginName;
	String password;
	LoginedUser currUser;
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
		Session se = HibernateSessionFactory.getSession();
		Criteria crit = se.createCriteria(Logininfo.class);
		//crit.add(Restrictions.eq("loginName", loginName));
		List<Logininfo> infos = crit.list();
		boolean login = false;
		for(Logininfo info:infos) {
			if(loginName.equals(info.getLoginName())) {
				if(password.equals(info.getPassword())) {
					Customerinfo cus = info.getCustomerinfo();
					currUser.setId(cus.getCustomerId());
					currUser.setFirstname(cus.getFirstName());
					login = true;
					break;
				}
			}			
		}
		if(!login) {
			this.addActionError("用户名或密码错误!");
		}
		
	}
}
