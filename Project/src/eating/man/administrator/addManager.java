package eating.man.administrator;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;
import com.cheating.hib.*;

public class addManager extends ActionSupport{
	private String loginName;
	private String password;
	private String repassword;
	private String managerName;
	private String restaurant;
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
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public void validate() {
		if(password != null && repassword != null){
			if(!repassword.equals(password))
				this.addActionError("两次输入密码不一致");
		}
	}
	public void add() throws IOException 
	{
		
		Session se = HibernateSessionFactory.getSession();
		Criteria crit2 = se.createCriteria(Restaurantinfo.class);
		crit2.add(Restrictions.eq("restaurantId", Integer.valueOf(restaurant)));
		List<Restaurantinfo> restinfos = crit2.list();
		int managerUpBound = restinfos.get(0).getManagerUpBound();
		Criteria crit3 = se.createCriteria(Managerinfo.class);
		crit3.add(Restrictions.eq("restaurantinfo",restinfos.get(0)));
		List<Managerinfo> mana = crit3.list();
		System.out.println("UpBound:..,,,,"+managerUpBound);
		if(managerUpBound <= mana.size())
		{
			HibernateSessionFactory.closeSession();
			response.sendRedirect("addManager.jsp?id=0");
		}
		else
		{
			System.out.println("fuck you!!!!!!!!!!!!!!");
		Logininfo in = new Logininfo();
		Managerinfo ma = new Managerinfo();
		Authority au = (Authority)se.load(Authority.class, 2);
		in.setLoginName(loginName);
		in.setPassword(password);
		in.setAuthority(au);
		ma.setLogininfo(in);
		ma.setName(managerName);
		ma.setRestaurantinfo(restinfos.get(0));
		Transaction tran = se.beginTransaction();
		se.save(ma);
		se.save(in);
		tran.commit();
		HibernateSessionFactory.closeSession();
		}
		
	}
	public String execute() throws Exception{
		System.out.println("tooooo  fuck cuihao!!!!!!!!!!!!!!");
		add();
		return SUCCESS;
		
	}
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response ;
	}

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
	
}
