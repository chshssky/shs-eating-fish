package fish.operation.cart;

import java.util.LinkedList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class PutCart extends ActionSupport{
	Cart mycart ;
	
	private int id ;
	private int course_count ;
	private Item course ;

	public Item getCourse() {
		return course;
	}


	public void setCourse(Item course) {
		this.course = course;
	}


	public void put()
	{
		//List<Item> current_list = new LinkedList<Item>() ;
		course = new Item() ;
		course.setCourse_id(id) ;
		course.setCourse_num(course_count) ;
		
		System.out.println(id+"haha") ;
		mycart = new Cart() ;
		
		
		//current_list.add(course) ;
		//mycart.setCart(current_list) ;
		mycart.getCart().add(course) ;
		
		
		if(!mycart.getCart().isEmpty())
		{
			System.out.println(mycart.getCart().iterator().next().getCourse_id()+"dui") ;
		}
		else System.out.println("budui") ;
		
	}
	
	
	@Override
	public String execute() throws Exception {
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


	public Cart getMycart() {
		return mycart;
	}


	public void setMycart(Cart mycart) {
		this.mycart = mycart;
	}
	
}
