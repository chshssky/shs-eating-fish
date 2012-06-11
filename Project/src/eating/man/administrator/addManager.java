package eating.man.administrator;
import java.util.ArrayList;
import java.util.List;

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
	private ArrayList<Restaurant> restaurantList;
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
	public void add() {
		
		Session se = HibernateSessionFactory.getSession();
		Criteria crit2 = se.createCriteria(Restaurantinfo.class);
		crit2.add(Restrictions.eq("name", Integer.valueOf(restaurant)));
		List<Restaurantinfo> restinfos = crit2.list();
		Logininfo in = new Logininfo();
		Managerinfo ma = new Managerinfo();
		Authority au = (Authority)se.load(Authority.class, 2);
		
		
		ma.setLogininfo(in);
		ma.setName(managerName);
		ma.setRestaurantinfo(restinfos.get(0));
		
		in.setLoginName(loginName);
		in.setPassword(password);
		in.setAuthority(au);
		
		
		
		Transaction tran = se.beginTransaction();
		se.save(ma);
		se.save(in);
		tran.commit();
		HibernateSessionFactory.closeSession();
	}
	public String execute() throws Exception{
		add();
		return SUCCESS;
		
	}
	public ArrayList<Restaurant> getRestaurantList() {
		return restaurantList;
	}
	public void setRestaurantList(ArrayList<Restaurant> restaurantList) {
		this.restaurantList = restaurantList;
	}
	
}
