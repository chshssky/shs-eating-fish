package fish.man.manager;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cheating.SessionBean.LoginedUser;
import com.opensymphony.xwork2.ActionSupport;

public class managerAction extends ActionSupport implements ServletRequestAware {
	private String picPath ;
	private HttpServletRequest request ;
	
	private boolean loadPic()
	{
		File pic = new File(picPath) ;
		if(!pic.exists())
			return false ;
		
		System.out.println(picPath) ;
		
		try {
			InputStream inStream = new FileInputStream(pic);
	        FileOutputStream fs = new FileOutputStream(Path.getDocPath() + "/" + pic.getName()) ; 
	        byte[] buffer = new byte[1444] ;  
	        int byteread = 0 ;        
			while ( (byteread = inStream.read(buffer)) != -1)  
			    fs.write(buffer, 0, byteread); 
		
	        inStream.close();
	        
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		
		return true ;
	}
	

	public String execute() throws Exception {
		if(picPath.isEmpty())
		{
			request.setAttribute("nullPath", "ÇëÊäÈëÍ¼Æ¬Â·¾¶") ;
			return INPUT ;
		}
		
		if(loadPic())
			return SUCCESS ;
		else
		{
			request.setAttribute("nullPath", "Í¼Æ¬Â·¾¶´íÎó") ;
			return INPUT ;
		}
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request ;
	}
}
