package fish.operation.cart;

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
	private HttpServletRequest request;

	private void order()
	{
		Session se = HibernateSessionFactory.getSession() ;
		Orderinfo curorder = (Orderinfo)se.load(Orderinfo.class, SubmitOrderAction.curOrderID()) ;
		curorder.setAddress(address) ;
		curorder.setFirstName(firstName) ; 
		curorder.setLastName(lastName) ;
		curorder.setTelephoneNum(telephoneNum) ;
		Transaction tran = se.beginTransaction();
		se.update(curorder) ;
		tran.commit() ;
		HibernateSessionFactory.closeSession() ;
	}
	
	public void validate()
	{
		if(address.isEmpty())
		{
			this.addActionError("�������ַ") ;
		}
	}
	
	public String execute() throws Exception
	{
		Login.getMycart().getCart().clear() ;
		
		order() ;
		request.setAttribute("orderSuc", "Ԥ���ɹ�") ;		
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
	
}
