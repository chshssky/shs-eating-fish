package fish.man.manager;

import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Ordercourses;
import com.cheating.hib.Orderinfo;
import com.opensymphony.xwork2.ActionSupport;

public class ManOrderRmvAction extends ActionSupport implements ServletRequestAware {
	private int curOrderId ;
	private int listIndex ;
	private HttpServletRequest request ;
	
	private void removeOrder() {
		int restId = (Integer)request.getSession().getAttribute("restId") ;
		
		Session se = HibernateSessionFactory.getSession() ;
		Orderinfo curOrder = (Orderinfo) se.load(Orderinfo.class, curOrderId) ;
		Set<Ordercourses> curOrderset = curOrder.getOrdercourseses() ;
		Transaction trans = se.beginTransaction() ;
		trans.begin() ;
		
		Iterator<Ordercourses> curOrderIt = curOrderset.iterator() ;
		while(curOrderIt.hasNext())
		{
			Ordercourses curOrderCourse = curOrderIt.next() ;
			if(curOrderCourse.getCourseinfo().getRestaurantinfo().getRestaurantId() == restId)
				se.delete(curOrderCourse) ;
		}
		
		if(curOrder.getOrdercourseses() == null || curOrder.getOrdercourseses().isEmpty())
			se.delete(curOrder) ;
		
		trans.commit() ;
		HibernateSessionFactory.closeSession() ;
		
		RestOrder.getRestList().remove(listIndex) ;
	}
	
	public String execute() throws Exception {
		removeOrder() ;
		request.getSession().setAttribute("rmvSuc", "É¾³ý³É¹¦") ;
		return SUCCESS ;
	}

	public int getCurOrderId() {
		return curOrderId;
	}

	public void setCurOrderId(int curOrderId) {
		this.curOrderId = curOrderId;
	}
	
	

	public int getListIndex() {
		return listIndex;
	}

	public void setListIndex(int listIndex) {
		this.listIndex = listIndex;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
	}
	
}
