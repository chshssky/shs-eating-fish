package fish.operation.cart;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.SessionBean.LoginedUser;
import com.cheating.hib.Courseinfo;
import com.cheating.hib.Customerinfo;
import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Ordercourses;
import com.cheating.hib.Orderinfo;
import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class SubmitOrderAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request ;
	private static int orderID ;
	
	private void create_order()
	{
		Session se = HibernateSessionFactory.getSession();
		Transaction tran = se.beginTransaction();
		Iterator<Item> order = Login.getMycart().getCart().iterator() ;
		
		Orderinfo orderInfo = new Orderinfo() ;
		int sum_price = 0 ;
		
		while(order.hasNext())
		{
			Item cur_order = order.next() ;
			Courseinfo course = (Courseinfo)se.load(Courseinfo.class, cur_order.getCourse_id()) ;
			sum_price += course.getPrice() ;
			
			Ordercourses orderCourses = new Ordercourses() ;
			orderCourses.setNum(cur_order.getCourse_num()) ;
			orderCourses.setCourseinfo(course) ;
			orderCourses.setOrderinfo(orderInfo) ;
			
			se.save(orderCourses);
		}
		
		LoginedUser currUser = (LoginedUser)request.getSession().getAttribute("currUser") ;
		Customerinfo currCus = (Customerinfo)se.load(Customerinfo.class, currUser.getId()) ;
		
		orderInfo.setCustomerinfo(currCus) ;
		orderInfo.setSumPrice(sum_price) ;
		orderInfo.setState("dealing") ;
		orderInfo.setAddress("temp") ;
		orderInfo.setLastName("temp") ;
		
		se.save(orderInfo);
		tran.commit();
		HibernateSessionFactory.closeSession();
		
		orderID = orderInfo.getOrderId() ;
	} 
	
	public static int curOrderID()
	{
		return orderID ;
	}
	
	public void validate()
	{
		if(Login.getMycart().getCart().isEmpty())
			this.addActionError("您的购物车为空") ;
	}
	
	public String execute() throws Exception{
		create_order() ;
		return SUCCESS ;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
