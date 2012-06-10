package fish.ui.user;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cheating.SessionBean.*;
import com.cheating.hib.*;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import fish.operation.cart.*;

public class Login extends ActionSupport implements ServletRequestAware, ServletResponseAware {
	private String loginName;
	private String password;
	private LoginedUser currUser;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private static Cart mycart ;
	
	public static Cart getMycart() {
		return mycart;
	}
	public static void setMycart(Cart mycart) {
		Login.mycart = mycart;
	}
	
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
		crit.add(Restrictions.eq("loginName", loginName));
		crit.add(Restrictions.eq("password", password));
		List<Logininfo> infos = crit.list();
		if (infos.size() <= 0) {
			this.addActionError("用户名或密码错误!");
		} else if (infos.size() == 1) {
			
			Logininfo info = infos.get(0);
			System.out.println("Login_Action:LoginID:" + info.getLoginId());
			String authority = info.getAuthority().getAuthorName();
			
			if (authority.equals("customer")) {	
				Set set = info.getCustomerinfos();
				Iterator it = set.iterator();
				while(it.hasNext()) {
					Customerinfo customer = (Customerinfo)it.next();
					System.out.println(customer.getCustomerId());
					currUser.setId(customer.getCustomerId());
					currUser.setFirstname(customer.getFirstName());
				}

				request.getSession().setAttribute("currUser", currUser);
				
				mycart = new Cart() ;
						
			} else if (authority.equals("manager")) {
				try {
					Set set = info.getManagerinfos() ;
					Iterator it = set.iterator();
					if(it.hasNext()) {
						Managerinfo manager = (Managerinfo)it.next();
						int restId = manager.getRestaurantinfo().getRestaurantId() ;
						request.getSession().setAttribute("restId", restId);
						request.getSession().setAttribute("curManager", manager);
						response.sendRedirect("manager.jsp");
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (authority.equals("admin")) {
				try {
					response.sendRedirect("Admin.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			
			//加一些登陆判断的语句： 比如说判断currUser的种类，或者权限，啥的。。。。
			HibernateSessionFactory.closeSession();	
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
