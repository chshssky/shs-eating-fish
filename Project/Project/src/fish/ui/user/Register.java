package fish.ui.user;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;
import com.cheating.hib.*;

public class Register extends ActionSupport{
	private String username ;
	private String password ;
	private String repassword ;
	private String telephonenum;
	private String firstname;
	private String lastname;
	private String email ;

	private boolean checkUser() {
		Session se = HibernateSessionFactory.getSession();
		
		Criteria crit = se.createCriteria(Logininfo.class);
    	crit.add(Restrictions.eq("loginName", username));
    	
    	if(crit.list().size() != 0)
    		return false ;
    	
    	else return true ;
	}
		
	
	
	private void register() {
		Session se = HibernateSessionFactory.getSession();
		
		Logininfo in = new Logininfo();
		Customerinfo cu = new Customerinfo();
		Authority au = (Authority)se.load(Authority.class, 1);
		
		cu.setEmail(email);
		cu.setFirstName(firstname);
		cu.setLastName(lastname);
		cu.setTelephoneNum(telephonenum);
		cu.setLogininfo(in);
		
		in.setLoginName(username);
		in.setPassword(password);
		in.setAuthority(au);
		
		
		Transaction tran = se.beginTransaction();
		se.save(cu);
		se.save(in);
		tran.commit();
		HibernateSessionFactory.closeSession();
	}
	
	public void validate() {
		if(password != null && repassword != null){
			if(!repassword.equals(password))
				this.addActionError("两次输入密码不一致");
		}
		
		if(!checkUser())
			this.addActionError("此用户名已存在");
	}
	
	public String execute() throws Exception{
		register();
		return SUCCESS;
		
	}
	public String getTelephonenum() {
		return telephonenum;
	}
	public void setTelephonenum(String telephonenum) {
		this.telephonenum = telephonenum;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
