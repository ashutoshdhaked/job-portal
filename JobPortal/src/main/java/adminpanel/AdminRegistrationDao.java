package adminpanel;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import databaseconnection.GetConnection;

public class AdminRegistrationDao {
    String query= "";

	public static boolean updatedata(AdminUseBean rb, String id) {
		String query="update admintable set name=?,username=?,email=?,age=?,phone=?,address=?,password=?,companyname=?,location=?,jobpost=?,image=?,imagename=? where id = ?";
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
			pstmt.setString(8,rb.getCompanyname());
			pstmt.setString(9,rb.getLocation());
			pstmt.setString(10,rb.getJobpost());
			
			// now set the image and and the resume in the database;
			// String uploads = AdminMultipart.uploadspath;
			  String uploads ="D:\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JobPortal\\uploads";
			    String imagepath=uploads+"//"+rb.getImagename();
			
			// set the image :
		    FileInputStream fin = new FileInputStream(imagepath);
			pstmt.setBinaryStream(11,fin,fin.available());
			pstmt.setString(12,rb.getImagename());
			pstmt.setString(13, id);
			int i = pstmt.executeUpdate();
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
