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

public class AddCourseAction extends ActionSupport implements ServletRequestAware {
	private String picPath ;
	private HttpServletRequest request ;
	
	private boolean loadPic()
	{
		File pic = new File(picPath) ;
		if(!pic.exists())
		{
			request.setAttribute("nullPath", "ͼƬ·������") ;
			return false ;
		}
		
		System.out.println(picPath) ;
		
		try {
			InputStream inStream = new FileInputStream(pic);
			File newPic = new File(Path.getDocPath() + "/" + pic.getName()) ;
			if(newPic.exists())
			{
				request.setAttribute("nullPath", "��������ͼƬ") ;  //���ߺ��濼�ǰ��ϴ���ͼƬ����Ϊ�Է���IDΪǰ׺��
				return false ;
			}
			
	        FileOutputStream fs = new FileOutputStream(newPic) ; 
	        
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
			request.setAttribute("nullPath", "������ͼƬ·��") ;
			return INPUT ;
		}
		
		if(loadPic())
			return SUCCESS ;
		else			
			return INPUT ;
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
