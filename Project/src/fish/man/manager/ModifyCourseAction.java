package fish.man.manager;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.Coursetype;
import com.cheating.hib.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class ModifyCourseAction extends ActionSupport {
	private int courseID ;
	private String modifyName ;
	private int modifyType ;
	private String modifyPrice ;
	private String modifyPic ;
	private String modifyDesc ;
	
	private void modify()
	{
		Session se = HibernateSessionFactory.getSession() ;
		Courseinfo curCourse = (Courseinfo) se.load(Courseinfo.class, courseID) ;
		if(modifyName != null && !modifyName.isEmpty())
			curCourse.setName(modifyName) ;
		
		Coursetype type = (Coursetype) se.load(Coursetype.class, modifyType) ;
		curCourse.setCoursetype(type) ;
		if(modifyPrice != null && !modifyPrice.isEmpty())
			curCourse.setPrice(Integer.valueOf(modifyPrice)) ;
		if(modifyPic != null && !modifyPic.isEmpty())
			curCourse.setPic(modifyPic) ;
		if(modifyDesc != null && !modifyDesc.isEmpty())
			curCourse.setDescript(modifyDesc) ;
		Transaction tran = se.beginTransaction() ;
		se.update(curCourse) ;
		tran.commit() ;
		HibernateSessionFactory.closeSession() ;
	}
	
	public String execute() throws Exception {
		modify() ;
		return SUCCESS ;
	}

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	
	public String getModifyName() {
		return modifyName;
	}

	public void setModifyName(String modifyName) {
		this.modifyName = modifyName;
	}

	public int getModifyType() {
		return modifyType;
	}

	public void setModifyType(int modifyType) {
		this.modifyType = modifyType;
	}

	public String getModifyPrice() {
		return modifyPrice;
	}

	public void setModifyPrice(String modifyPrice) {
		this.modifyPrice = modifyPrice;
	}

	public String getModifyPic() {
		return modifyPic;
	}

	public void setModifyPic(String modifyPic) {
		this.modifyPic = modifyPic;
	}

	public String getModifyDesc() {
		return modifyDesc;
	}

	public void setModifyDesc(String modifyDesc) {
		this.modifyDesc = modifyDesc;
	}

}
