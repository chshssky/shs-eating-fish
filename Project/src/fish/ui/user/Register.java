package fish.ui.user;

import com.opensymphony.xwork2.ActionSupport;

public class Register extends ActionSupport{
	private String username ;
	private String password ;
	private String repassword ;
	private String email ;
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
	
	public void validate() {
		if(password != null && repassword != null && !repassword.equals(password)){
			this.addActionError("Confirm should be equal to the password");
		}
	}
}