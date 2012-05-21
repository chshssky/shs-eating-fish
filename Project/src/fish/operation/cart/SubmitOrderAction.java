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
	
	private void create_order()
	{
		Iterator<Item> order = Login.getMycart().getCart().iterator() ;
		Ordercourses orderCourses = new Ordercourses() ;
		Orderinfo orderInfo = new Orderinfo() ;
		int sum_price = 0 ;
		
		Session se = HibernateSessionFactory.getSession();
		
		while(order.hasNext())
		{
			Item cur_order = order.next() ;
			Courseinfo course = (Courseinfo)se.load(Courseinfo.class, cur_order.getCourse_id()) ;
			sum_price += course.getPrice() ;
			
			orderCourses.setNum(cur_order.getCourse_num()) ;
			orderCourses.setCourseinfo(course) ;
			orderCourses.setOrderinfo(orderInfo) ;
		}
		
		LoginedUser currUser = (LoginedUser)request.getSession().getAttribute("currUser") ;
		Customerinfo currCus = (Customerinfo)se.load(Customerinfo.class, currUser.getId()) ;
		
		orderInfo.setCustomerinfo(currCus) ;
		orderInfo.setSumPrice(sum_price) ;
		orderInfo.setAddress("temp") ;
		orderInfo.setState("dealing") ;
		Transaction tran = se.beginTransaction();
		se.save(orderInfo);
		se.save(orderCourses);
		tran.commit();
		HibernateSessionFactory.closeSession();
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
