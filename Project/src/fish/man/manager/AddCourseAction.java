package fish.man.manager;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cheating.SessionBean.LoginedUser;
import com.cheating.hib.Courseinfo;
import com.cheating.hib.Coursetype;
import com.cheating.hib.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class AddCourseAction extends ActionSupport implements ServletRequestAware {
	private String picPath ;
	private String courseType ;
	private String courseName ;
	private String courseDesc ;
	private String coursePrice ;
	private HttpServletRequest request ;
	
	private boolean loadPic()
	{
		File pic = new File(picPath) ;
		if(!pic.exists())
		{
			request.setAttribute("nullPath", "图片路径错误") ;
			return false ;
		}
		
		System.out.println(picPath) ;
		
		try {
			InputStream inStream = new FileInputStream(pic);
			//或者后面考虑把上传的图片改名为以饭店ID为前缀？			
			File newPic = new File(Path.getDocPath() + "/" + pic.getName()) ; 
			//newPic.renameTo(restName + name) ;
			if(newPic.exists())
			{
				request.setAttribute("nullPath", "请重命名图片") ;  
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
	
	private boolean addCourse() {
		if(courseType.isEmpty())
		{
			request.setAttribute("nullPath", "请选择菜的类别") ;
			return false ;
		}
		
		if(courseName.isEmpty())
		{
			request.setAttribute("nullPath", "请输入菜名") ;
			return false ;
		}
		
		if(coursePrice.isEmpty())
		{
			request.setAttribute("nullPath", "请输入菜价") ;
			return false ;
		}
		
		if(courseDesc.isEmpty())
		{
			request.setAttribute("nullPath", "请选择菜的简介") ;
			return false ;
		}
		
		Session se = HibernateSessionFactory.getSession() ;
		Courseinfo newCourse = new Courseinfo() ;
		Coursetype type = (Coursetype)se.load(Coursetype.class, Integer.valueOf(courseType));
		newCourse.setCoursetype(type) ;
		newCourse.setName(courseName) ;
		newCourse.setPrice(Integer.valueOf(coursePrice)) ;
		newCourse.setDescript(courseDesc) ;
		newCourse.setPic(Path.getNewPicPath()) ;
		
		Transaction tran = se.beginTransaction() ;
		se.save(newCourse) ;
		tran.commit() ;
		HibernateSessionFactory.closeSession() ;
		
		return true ;
	}

	public String execute() throws Exception {
		if(picPath.isEmpty())
		{
			request.setAttribute("nullPath", "请输入图片路径") ;
			return INPUT ;
		}
		
		if(loadPic() && addCourse())
		{
			request.setAttribute("nullPath", "添加成功") ;
			return SUCCESS ;
		}
		else			
			return INPUT ;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	
	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseDesc() {
		return courseDesc;
	}

	public void setCourseDesc(String courseDesc) {
		this.courseDesc = courseDesc;
	}

	public String getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(String coursePrice) {
		this.coursePrice = coursePrice;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
	}

}
