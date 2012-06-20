package fish.man.manager;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Ordercourses;
import com.cheating.hib.Orderinfo;
import com.opensymphony.xwork2.ActionSupport;

public class DeliveryAction extends ActionSupport{
	private String curOCId;
	private String curOrderId;

	public String getCurOCId() {
		return curOCId;
	}

	public void setCurOCId(String curOCId) {
		this.curOCId = curOCId;
	}

	public String getCurOrderId() {
		return curOrderId;
	}

	public void setCurOrderId(String curOrderId) {
		this.curOrderId = curOrderId;
	}
	
	public void changeState() {
		int ocid = Integer.valueOf(curOCId);
		Session se = HibernateSessionFactory.getSession();
		Ordercourses oc = (Ordercourses)se.load(Ordercourses.class, ocid);
		oc.setState("已配送");
		Transaction tran = se.beginTransaction();
		se.update(oc);
		tran.commit();
		HibernateSessionFactory.closeSession();	
	}
	public void checkOrderState() {
		int oid = Integer.valueOf(curOrderId);
		Session se = HibernateSessionFactory.getSession();
		Criteria crit = se.createCriteria(Ordercourses.class);
		Orderinfo OrdInfo = (Orderinfo)se.load(Orderinfo.class, oid);
		crit.add(Restrictions.eq("orderinfo", OrdInfo));
		List<Ordercourses> ocInfo = crit.list();
		
		boolean b = false;
		for (Ordercourses oc2: ocInfo) {
			if (oc2.getState().equals("未提交") || oc2.getState().equals("处理中")) {
				b = true;
				break;
			}
		}
		if (b == false) {
			OrdInfo.setState("已完成");
			Transaction tran = se.beginTransaction();
			se.update(OrdInfo);
			tran.commit();
		}
		HibernateSessionFactory.closeSession();	
	}

	public String execute() throws Exception {
		System.out.println("execute~~"+curOCId+"!!"+curOrderId);
		changeState();
		checkOrderState();
		return SUCCESS;
	}
	
}
