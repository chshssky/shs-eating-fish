package fish.man.manager;

import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Ordercourses;
import com.cheating.hib.Orderinfo;
import com.opensymphony.xwork2.ActionSupport;

public class ManHandleAction extends ActionSupport implements ServletRequestAware{
	private int curOrderId2 ;
	private int listIndex2 ;
	private HttpServletRequest request ;
	
	private void changeState()
	{
		//int restId = (Integer)request.getSession().getAttribute("restId") ;
		//RestOrder.searchOrder(restId) ;
		Session se = HibernateSessionFactory.getSession() ;
		
		System.out.println("index" + listIndex2) ;
		//Orderinfo oinfo = (Orderinfo) se.load(Orderinfo.class, curOrderId2) ;
		//Set<Ordercourses> orset = oinfo.getOrdercourseses() ;
		SingleOrder cursingle = RestOrder.getRestList().get(listIndex2) ;
		
		for(int i = 0; i < cursingle.getCourses().size(); ++ i)
		{
			//Set<Ordercourses> curOrset = cursingle.getCourses().get(i).getOrdercourseses() ;
			//Iterator<Ordercourses> itset = curOrset.iterator() ;
		
			
		//Criteria orderCourse = se.createCriteria(Ordercourses.class) ;
		//Iterator<Ordercourses> orderCourselist = orderCourse.list().iterator() ;
			//if(itset.hasNext())
			{
				//Ordercourses curOrderCourse = itset.next() ;
				Ordercourses curOrderCourse = cursingle.getOrdercourses().get(i) ;
				System.out.println("oc" + curOrderCourse.getOrderCoursesId()) ;
				//Courseinfo curCourse = curOrderCourse.getCourseinfo() ;
				//Courseinfo curCourse = RestOrder.getRestList().get(listIndex2).getCourses().get(i) ;
				
				 
				
				curOrderCourse.setState("已完成") ;
				
				Transaction trans = se.beginTransaction() ;
				se.beginTransaction() ;
				trans.begin();
				se.update(curOrderCourse) ;
				trans.commit() ;
			}
		
			/*boolean change = true ;
			while(itset.hasNext())
			{
				Ordercourses cur = itset.next() ;
				if(!cur.getState().equals("处理中"))
				{	
					change = false ;
					break ;
				}
			}
			
			if(change == true)
				oinfo.setState("已完成") ;*/
	
		}
		HibernateSessionFactory.closeSession() ;
	}
	
	public String execute() throws Exception {
		changeState() ;
		return SUCCESS ;
	}
	
	public int getCurOrderId() {
		return curOrderId2;
	}
	public void setCurOrderId(int curOrderId) {
		this.curOrderId2 = curOrderId;
	}
	public int getListIndex2() {
		return listIndex2;
	}
	public void setListIndex2(int listIndex) {
		this.listIndex2 = listIndex;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
		
	}
}
