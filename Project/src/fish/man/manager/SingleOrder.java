package fish.man.manager;

import java.util.List;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.Ordercourses;
import com.cheating.hib.Orderinfo;

public class SingleOrder { 
	private Orderinfo order ;
	private List<Courseinfo> courses ;
	private List<Ordercourses> ordercourses ;
	private List<Integer> num ;
	private List<String> state ;
	
	public List<String> getState() {
		return state;
	}
	public void setState(List<String> state) {
		this.state = state;
	}
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
	public List<Ordercourses> getOrdercourses() {
		return ordercourses;
	}
	public void setOrdercourses(List<Ordercourses> ordercourses) {
		this.ordercourses = ordercourses;
	}
}