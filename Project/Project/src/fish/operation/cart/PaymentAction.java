package fish.operation.cart;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Ordercourses;
import com.cheating.hib.Orderinfo;
import com.opensymphony.xwork2.ActionSupport;

import fish.ui.user.Login;

public class PaymentAction extends ActionSupport implements ServletRequestAware{
	private String address ;
	private String firstName ;
	private String lastName ;
	private String telephoneNum ;
	private String demandDate;
	private String demandTime;
	private String dt;
	private HttpServletRequest request;

	private void order()
	{
	}
	
	private boolean isNum(String num) {
		for(int i = 0; i < num.length(); ++ i)
			if(num.charAt(i) > '9' || num.charAt(i) < '0')
				return false ;
		
		return true ;
	}
	
	
	public void validate()
	{

		if(address.isEmpty())
		{
			this.addActionError("请输入地址") ;
		}
		
		if(firstName.isEmpty() || lastName.isEmpty())
		{
			this.addActionError("请输入姓名") ;
		}
		
		if(telephoneNum.isEmpty())
		{
			this.addActionError("请输入电话号码") ;
		}
		
		if(!isNum(telephoneNum))
		{
			this.addActionError("请输入正确电话号码") ;
		}
		Timestamp datetime;

		
		System.out.println(demandDate);
		System.out.println(demandTime);
		
		System.out.println(demandDate.substring(0, 10));
		System.out.println(demandTime.substring(11, 19));
		dt = demandDate.substring(0, 10) + " " + demandTime.substring(11, 19);
		System.out.println(dt);
		datetime = Timestamp.valueOf(dt);
		
		java.util.Date   d=new   java.util.Date(); 
        java.text.DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Calendar c1=java.util.Calendar.getInstance();
        java.util.Calendar c2=java.util.Calendar.getInstance();
		System.out.println( "当前系统时间为： "+df.format(d));	
		System.out.println("预定时间为" + dt);
        try
        {
            c1.setTime(df.parse(df.format(d)));
            c2.setTime(df.parse(dt));
        }catch(java.text.ParseException e){
            System.err.println("格式不正确");
        }
        int result = c1.compareTo(c2);		
		if(result >= 0)
		{
			this.addActionError("请输入正确的时间，时光荏苒，不能倒流");
		}
		Session se = HibernateSessionFactory.getSession() ;

		
		Orderinfo curorder = (Orderinfo)se.load(Orderinfo.class, SubmitOrderAction.getOrderID()) ;
		curorder.setAddress(address) ;
		curorder.setFirstName(firstName) ; 
		curorder.setLastName(lastName) ;
		curorder.setTelephoneNum(telephoneNum) ;
		curorder.setState("处理中") ;
		curorder.setDemandTime(datetime);
		curorder.setOrderTime(Timestamp.valueOf(df.format(d)));
		
		Criteria crit = se.createCriteria(Ordercourses.class);
		crit.add(Restrictions.eq("orderinfo", curorder));
		List<Ordercourses> os = crit.list();
		
		Transaction tran = se.beginTransaction();
		se.update(curorder) ;
		for (Ordercourses o: os)
		{
			o.setState("处理中");
			se.update(o);
		}
		tran.commit() ;
		HibernateSessionFactory.closeSession() ;
	}
	
	public String execute() throws Exception
	{
		Login.getMycart().getCart().clear() ;
		request.getSession().setAttribute("orderSuc", "预订成功") ;		
		return SUCCESS;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getTelephoneNum() {
		return telephoneNum;
	}

	public void setTelephoneNum(String telephoneNum) {
		this.telephoneNum = telephoneNum;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
	}

	public String getDemandDate() {
		return demandDate;
	}

	public void setDemandDate(String demandDate) {
		this.demandDate = demandDate;
	}

	public String getDemandTime() {
		return demandTime;
	}

	public void setDemandTime(String demandTime) {
		this.demandTime = demandTime;
	}

	
}
