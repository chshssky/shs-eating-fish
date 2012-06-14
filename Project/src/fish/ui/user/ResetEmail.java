package fish.ui.user;

import org.hibernate.Session;

import com.cheating.hib.*;
import com.opensymphony.xwork2.ActionSupport;

public class ResetEmail extends ActionSupport{
	private String new_email ;

	public String getNew_email() {
		return new_email;
	}

	public void setNew_email(String new_email) {
		this.new_email = new_email;
	}
	public void writeEmail() {
		Session se = HibernateSessionFactory.getSession();
		
		Customerinfo cu = new Customerinfo();
		cu = se.load(Customerinfo.class, );
		
		
		
	}
	public void validate() {
		if()
		
	}
	public  String execute() throws Exception{
		
		return SUCCESS;
	}
}
