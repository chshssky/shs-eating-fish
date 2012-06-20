package fish.operation.cart;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.cheating.SessionBean.LoginedUser;
import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class PutCart extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	//Cart mycart ;
	
	private int id ;
	private int course_count ;
	private int restaurant_id ;
	private Item course ;
	private LoginedUser currUser ;
	private HttpServletRequest request;
	private HttpServletResponse response;	
	
	public LoginedUser getCurrUser() {
		return currUser;
	}

	public void setCurrUser(LoginedUser currUser) {
		this.currUser = currUser;
	}
	
	public Item getCourse() {
		return course;
	}

	public void setCourse(Item course) {
		this.course = course;
	}


	public void put() throws IOException
	{
		course = new Item() ;
		if(course_count == 0)
			course_count = 1 ;
		course.setCourse_id(id) ;
		course.setCourse_num(course_count) ;
		
		Cart current_cart = Login.getMycart() ;
		Iterator<Item> cart_it = current_cart.getCart().iterator() ;
		boolean if_exist = false ;
		int index = 0 ;
		
		//查看当前加入的菜是否已经在购物车中，是则把数量相加
		while(cart_it.hasNext())
		{
			Item current_course= cart_it.next() ;
			if(current_course.getCourse_id() == id)
			{
				if_exist = true ;
				break ;
			}
			
			++ index ;
		}
		
		if(!if_exist)
			current_cart.getCart().add(course) ;
		else
		{
			int pre_num = current_cart.getCart().get(index).getCourse_num() ;
			current_cart.getCart().get(index).setCourse_num(pre_num + course_count) ;
		}
		
		request.getSession().setAttribute("mycart", Login.getMycart()) ;
		
		response.sendRedirect("showRestaurant.jsp?id=" + restaurant_id);
	}
	
	@Override
	public String execute() throws Exception {
		currUser = (LoginedUser)request.getSession().getAttribute("currUser") ;
		
		if(currUser.getId() == 0)
		{
			request.setAttribute("needLogin", "请先登录") ;
			return INPUT ;
		}
		
		put() ;
		return SUCCESS;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getCourse_count() {
		return course_count;
	}


	public void setCourse_count(int course_count) {
		this.course_count = course_count;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response ;
	}

	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

}
