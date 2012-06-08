package fish.man.manager;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class Test extends ActionSupport implements  ServletRequestAware{
	private HttpServletRequest request ;
	
	public String execute() throws Exception {
		int militaryRanks[] = {'1', '2', '3'} ;
		request.setAttribute("militaryRanks", militaryRanks) ;
		return SUCCESS ;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
		
	}
}
