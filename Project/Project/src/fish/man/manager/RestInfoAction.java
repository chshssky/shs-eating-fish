package fish.man.manager;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Restaurantinfo;
import com.opensymphony.xwork2.ActionSupport;

public class RestInfoAction extends ActionSupport implements ServletRequestAware {
	private String restInfo ;
	private HttpServletRequest request ;
	
	private boolean modify()
	{
		Session se = HibernateSessionFactory.getSession() ;
		int id = (Integer)request.getSession().getAttribute("restId") ;
		Restaurantinfo curRest = (Restaurantinfo) se.load(Restaurantinfo.class, id) ;
		
		if(restInfo != null && !restInfo.isEmpty())
		{
			curRest.setDescript(restInfo) ;
			Transaction tran = se.beginTransaction() ;
			tran.begin() ;
			se.update(curRest) ;
			tran.commit() ;
			HibernateSessionFactory.closeSession() ;
			return true ;
		}
		else
		{
			request.getSession().setAttribute("modiRestError", "内容不能为空") ;
			return false ;
		}
	}
	
	public String execute() throws Exception {
		if(modify())
			return SUCCESS ;
		else return INPUT ;
	} 

	public String getRestInfo() {
		return restInfo;
	}

	public void setRestInfo(String restInfo) {
		this.restInfo = restInfo;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;	
	}
}
