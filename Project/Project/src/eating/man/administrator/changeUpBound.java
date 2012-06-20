package eating.man.administrator;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;
import com.cheating.hib.*;
public class changeUpBound extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	private String id;
	private String newUpBound;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNewUpBound() {
		return newUpBound;
	}
	public void setNewUpBound(String newUpBound) {
		this.newUpBound = newUpBound;
	}
	public void change()
	{
		Session se = HibernateSessionFactory.getSession();
		Criteria crit2 = se.createCriteria(Restaurantinfo.class);
		//crit2.add(Restrictions.eq("restaurantId", Integer.valueOf(id)));
		Restaurantinfo rest = (Restaurantinfo)se.load(Restaurantinfo.class, Integer.valueOf(id));
		rest.setManagerUpBound(Integer.valueOf(newUpBound));
		Transaction tran = se.beginTransaction();
		se.save(rest);
		tran.commit();
		HibernateSessionFactory.closeSession();
	}
	public String execute()
	{
		change();
		return SUCCESS;
	}
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response ;
	}

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

}
