package fish.operation.cart;

import java.util.Iterator;

import javax.swing.JOptionPane;

import com.cheating.SessionBean.LoginedUser;
import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class RmvCourseAction extends ActionSupport{
	private int course_id ;
	
	private void remove()
	{
		Iterator<Item> cart_list = Login.getMycart().getCart().iterator() ;
		int index = 0 ;
		Item current_course = new Item() ;
		while(cart_list.hasNext())
		{
			current_course = cart_list.next() ;
			if(current_course.getCourse_id() == course_id)
				break ;
			
			++ index ;
		}
		Login.getMycart().getCart().remove(index) ;
	}
	
	public String execute() throws Exception 
	{		
		remove() ;
		return SUCCESS;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
}
