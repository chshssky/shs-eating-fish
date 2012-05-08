package fish.ui.user;

import com.opensymphony.xwork2.ActionSupport;

public class ResetEmail extends ActionSupport{
	private String new_email ;

	public String getNew_email() {
		return new_email;
	}

	public void setNew_email(String new_email) {
		this.new_email = new_email;
	}
}
