package fish.man.manager;

import java.util.List;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.Orderinfo;

public class SingleOrder { 
	private Orderinfo order ;
	private List<Courseinfo> courses ;
	private List<Integer> num ;
	
	public List<Integer> getNum() {
		return num;
	}
	public void setNum(List<Integer> num) {
		this.num = num;
	}
	public Orderinfo getOrder() {
		return order;
	}
	public void setOrder(Orderinfo order) {
		this.order = order;
	}
	public List<Courseinfo> getCourses() {
		return courses;
	}
	public void setCourses(List<Courseinfo> courses) {
		this.courses = courses;
	}
}