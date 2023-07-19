package employeepanel;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import databaseconnection.GetConnection;

public class EmployeeRegistrationDao {
	
	public static  boolean updatedata(EmployeeUseBean rb,String id) {
	String query="update employee set name=?,username=?,email=?,age=?,phone=?,address=?,password=?,collegename=?,stream=?,ten=?,twelve=?,degree=?,experience=?,skill=?,image=?,imagename=?,resume=?,resumename=? where id = '"+id+"'";
	Connection con = GetConnection.getConnection();
	try {
		
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1,rb.getName());
		pstmt.setString(2,rb.getUsername());
		pstmt.setString(3,rb.getEmail());
		pstmt.setString(4,rb.getAge());
		pstmt.setString(5,rb.getPhone());
		pstmt.setString(6,rb.getAddress());
		pstmt.setString(7,rb.getPassword());
		pstmt.setString(8,rb.getCollege());
		pstmt.setString(9,rb.getCourse());
		pstmt.setString(10,rb.getTen());
		pstmt.setString(11,rb.getTwelve());
		pstmt.setString(12,rb.getDegree());
		pstmt.setString(13,rb.getExperience());
		pstmt.setString(14,rb.getSkill());
		// now set the image and and the resume in the database;
		// String uploads = EmployeeMultipart.uploadspath;
		String uploads ="D:\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JobPortal\\uploads";
		    String imagepath=uploads+"//"+rb.getImagename();
		    String resumepath = uploads+"//"+rb.getResumename();
		
		// set the image :
	    FileInputStream fin = new FileInputStream(imagepath);
		pstmt.setBinaryStream(15,fin,fin.available());
		pstmt.setString(16,rb.getImagename());
		
		// set the resume :
		FileInputStream fin1 = new FileInputStream(resumepath);
		pstmt.setBinaryStream(17,fin1,fin1.available());		
		pstmt.setString(18,rb.getResumename());
	     int i=pstmt.executeUpdate();
		if(i==1) {
		return true;
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return false;
	}
}
