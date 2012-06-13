package fish.man.manager;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.hib.Courseinfo;
import com.cheating.hib.Coursetype;
import com.cheating.hib.HibernateSessionFactory;
import com.cheating.hib.Restaurantinfo;
import com.opensymphony.xwork2.ActionSupport;

public class ModifyCourseAction extends ActionSupport implements ServletRequestAware {
	private int courseID ;
	private String modifyName ;
	private int modifyType ;
	private String modifyPrice ;
	private String modifyPic ;
	private String modifyDesc ;
	private HttpServletRequest request ;
	private Restaurantinfo curRest ;
	
	private void createPath()
	{
		Path.setCurPath(request.getSession().getServletContext().getRealPath("/")) ;
   		
   		System.out.println(request.getSession().getServletContext().getRealPath("/")) ;
   		String curPath = Path.getCurPath() ;
   		String docPath = curPath + "/pictures" ;
   		Path.setDocPath(docPath) ;
   		
   		File picDoc = new File(docPath) ;
		if(!picDoc.exists())
		{
			picDoc.mkdir() ;
		}
	}
	
	private boolean loadPic()
	{
		createPath();
		
		Session se = HibernateSessionFactory.getSession() ;
		int restId = (Integer)request.getSession().getAttribute("restId") ;
		curRest = (Restaurantinfo) se.load(Restaurantinfo.class, restId) ;
		File pic = new File(modifyPic) ;
		if(!pic.exists())
		{
			request.setAttribute("nullPath", "Õº∆¨¬∑æ∂¥ÌŒÛ") ;
			return false ;
		}
		
		try {
			InputStream inStream = new FileInputStream(pic);			
			File newPic = new File(Path.getDocPath() + "/" + curRest.getRestaurantId() + pic.getName()) ; 
		
			if(newPic.exists())
			{
				request.setAttribute("nullPath", "«Î÷ÿ√¸√˚Õº∆¨") ;  
				return false ;
			}
			
	        FileOutputStream fs = new FileOutputStream(newPic) ; 
	        
	        byte[] buffer = new byte[1444] ;  
	        int byteread = 0 ;        
			while ( (byteread = inStream.read(buffer)) != -1)  
			    fs.write(buffer, 0, byteread); 
		
	        inStream.close();
	        
	        Path.setNewPicPath("pictures/" + newPic.getName()) ;
	        
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
			
		return true ;
	}
	
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
			curCourse.setPic(Path.getNewPicPath()) ;
		if(modifyDesc != null && !modifyDesc.isEmpty())
			curCourse.setDescript(modifyDesc) ;
		Transaction tran = se.beginTransaction() ;
		se.update(curCourse) ;
		tran.commit() ;
		HibernateSessionFactory.closeSession() ;
	}
	
	public String execute() throws Exception {
		modify() ;
		
		if(!loadPic())
			return INPUT ;
		
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

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
		
	}

}
