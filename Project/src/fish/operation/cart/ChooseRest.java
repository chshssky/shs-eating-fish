package fish.operation.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Restaurantinfo;

public class ChooseRest extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
	{
		int id =Integer.valueOf(request.getParameter("id"));
		Session se = HibernateSessionFactory.getSession();
		Criteria crit = se.createCriteria(Courseinfo.class);
		if(id != 0)
		{
			Criteria crit2 = se.createCriteria(Restaurantinfo.class);
			crit2.add(Restrictions.eq("restaurantId", id));
			List<Restaurantinfo> restinfos = crit2.list();
	
			crit.add(Restrictions.eq("restaurantinfo", restinfos.get(0)));
	
		}
		List<Courseinfo> courseinfos = crit.list();
		request.setAttribute("chooseRest", courseinfos) ;
		request.getRequestDispatcher("showCourse.jsp").forward(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
	{
		doGet(request, response) ;
	}
}
