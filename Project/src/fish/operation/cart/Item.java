package fish.operation.cart;

import com.cheating.hib.Courseinfo;

public class Item {
	private Courseinfo course ;
	private int course_id ;
	private int course_num ;
	
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public int getCourse_num() {
		return course_num;
	}
	public void setCourse_num(int course_num) {
		this.course_num = course_num;
	}
	
}
