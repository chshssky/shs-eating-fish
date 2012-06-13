package fish.operation.cart;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Orderinfo;
import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class PaymentAction extends ActionSupport implements ServletRequestAware{
	private String address ;
	private String firstName ;
	private String lastName ;
	private String telephoneNum ;
	private String demandDate;
	private String demandTime;
	private HttpServletRequest request;

	private void order()
	{
		Timestamp datetime;
		Session se = HibernateSessionFactory.getSession() ;
		Orderinfo curorder = (Orderinfo)se.load(Orderinfo.class, SubmitOrderAction.getOrderID()) ;
		curorder.setAddress(address) ;
		curorder.setFirstName(firstName) ; 
		curorder.setLastName(lastName) ;
		curorder.setTelephoneNum(telephoneNum) ;
		curorder.setState("finish") ;
		curorder.setDemandTime(new timestamp());
		
		System.out.println(demandDate);
		System.out.println(demandTime);
		
		System.out.println(demandDate.substring(0, 8));
		System.out.println(demandTime.substring(10, 17));
		Transaction tran = se.beginTransaction();
		se.update(curorder) ;
		tran.commit() ;
		HibernateSessionFactory.closeSession() ;
	}
	
	private boolean isNum(String num) {
		for(int i = 0; i < num.length(); ++ i)
			if(num.charAt(i) > '9' || num.charAt(i) < '0')
				return false ;
		
		return true ;
	}
	
	
	public void validate()
	{
		if(address.isEmpty())
		{
			this.addActionError("请输入地址") ;
		}
		
		if(firstName.isEmpty() || lastName.isEmpty())
		{
			this.addActionError("请输入姓名") ;
		}
		
		if(telephoneNum.isEmpty())
		{
			this.addActionError("请输入电话号码") ;
		}
		
		if(!isNum(telephoneNum))
		{
			this.addActionError("请输入正确电话号码") ;
		}
	}
	
	public String execute() throws Exception
	{
		Login.getMycart().getCart().clear() ;
		
		order() ;
		request.getSession().setAttribute("orderSuc", "预订成功") ;		
		return SUCCESS;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getTelephoneNum() {
		return telephoneNum;
	}

	public void setTelephoneNum(String telephoneNum) {
		this.telephoneNum = telephoneNum;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
	}

	public String getDemandDate() {
		return demandDate;
	}

	public void setDemandDate(String demandDate) {
		this.demandDate = demandDate;
	}

	public String getDemandTime() {
		return demandTime;
	}

	public void setDemandTime(String demandTime) {
		this.demandTime = demandTime;
	}

	
}
