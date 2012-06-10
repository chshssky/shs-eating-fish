package fish.operation.cart;

import com.opensymphony.xwork2.ActionSupport;

public class ConOrderAction extends ActionSupport {
	private int curOrderId ;
	public String execute() throws Exception {
		SubmitOrderAction.setOrderID(curOrderId) ;
		return SUCCESS ;
	}
	
	public int getCurOrderId() {
		return curOrderId;
	}
	public void setCurOrderId(int curOrderId) {
		this.curOrderId = curOrderId;
	}
}
