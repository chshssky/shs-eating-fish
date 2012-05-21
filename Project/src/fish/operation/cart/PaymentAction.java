package fish.operation.cart;

import javax.swing.JOptionPane;

import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class PaymentAction extends ActionSupport{
	private String address ;

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
		JOptionPane.showMessageDialog(null, "预订成功") ;
		return SUCCESS;
		
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
