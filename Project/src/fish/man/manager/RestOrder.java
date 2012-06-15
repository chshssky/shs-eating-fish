package fish.man.manager;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Ordercourses;
import com.cheating.hib.Orderinfo;

public class RestOrder {
	private static List<SingleOrder> restList ;
	
	public static List<SingleOrder> getRestList() {
		return restList;
	}

	public static void setRestList(List<SingleOrder> restList) {
		RestOrder.restList = restList;
	}
	
	public static void searchOrder(int restId)
	{
		RestOrder.setRestList(new LinkedList<SingleOrder>()) ;
		
		Session se = HibernateSessionFactory.getSession() ;
		Criteria orderCourse = se.createCriteria(Ordercourses.class) ;
		Iterator<Ordercourses> orderCourselist = orderCourse.list().iterator() ;
		while(orderCourselist.hasNext())
		{
			Ordercourses curOrderCourse = orderCourselist.next() ;
			Courseinfo curCourse = curOrderCourse.getCourseinfo() ;
			Orderinfo curOrder = curOrderCourse.getOrderinfo() ;
		
			if(curCourse.getRestaurantinfo().getRestaurantId() == restId)
			{
				boolean exist = false ;
				int count = 0 ;
				
			
				Iterator<SingleOrder> curSingleList = RestOrder.getRestList().iterator() ;
				
				for( ;curSingleList.hasNext(); ++ count)
				{
					SingleOrder curSingle = curSingleList.next() ;
					if(curSingle.getOrder().getOrderId() == curOrder.getOrderId())
					{
						exist = true ;
						break ;
					}
				}
				
				if(exist == true)
				{
					
					RestOrder.getRestList().get(count).getCourses().add(curCourse) ;
					RestOrder.getRestList().get(count).getNum().add(curOrderCourse.getNum()) ;
				}
				else
				{
					SingleOrder cur = new SingleOrder() ;
					cur.setOrder(new Orderinfo()) ;
					
					//cur.setState(new LinkedList<String>()) ;					
					cur.setOrdercourses(new LinkedList<Ordercourses>()) ;
					cur.setCourses(new LinkedList<Courseinfo>()) ;
					cur.setNum(new LinkedList<Integer>()) ;
					cur.setOrder(curOrder) ;
					cur.getCourses().add(curCourse) ;
					cur.getNum().add(curOrderCourse.getNum()) ;
					cur.getOrdercourses().add(curOrderCourse) ;
					//cur.getState().add(curOrderCourse.getState()) ;
			
					RestOrder.getRestList().add(cur) ;
				}
			}	
		}
	}
}




