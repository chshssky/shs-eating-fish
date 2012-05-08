package fish.ui.user;

import com.opensymphony.xwork2.ActionSupport;

public class ResetPass extends ActionSupport{
	private String new_pass ;

	public String getNew_pass() {
		return new_pass;
	}

	public void setNew_pass(String new_pass) {
		this.new_pass = new_pass;
	}
}
