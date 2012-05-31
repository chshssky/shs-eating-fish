package fish.operation.cart;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class PaymentAction extends ActionSupport implements ServletRequestAware{
	private String address ;
	private HttpServletRequest request;

	private void order()
	{
		
	}
	
	public void validate()
	{
		if(address.isEmpty())
		{
			this.addActionError("请输入地址") ;
		}
	}
	
	public String execute() throws Exception{
		Login.getMycart().getCart().clear() ;
		request.setAttribute("orderSuc", "预订成功") ;		
		return SUCCESS;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
	}
	
}
