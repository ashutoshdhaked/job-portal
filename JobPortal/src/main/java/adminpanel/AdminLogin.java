package adminpanel;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comman.StoreFileInDownloads;
import databaseconnection.GetConnection;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.isNew()) {
			
		}
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Connection con = GetConnection.getConnection();
		String query ="select * from admintable where email= ? and password=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			   pstmt.setString(1,email);
			   pstmt.setString(2,password);
			 ResultSet rs = pstmt.executeQuery();      
			 if(rs.next()) {
					String id= rs.getString(1);
					String username =rs.getString(2);
					 // getting picture's bytes from database
					Blob b = rs.getBlob(12);
					byte[] barr = b.getBytes(1,(int) b.length()); 
					String imagename = rs.getString(13);  // getting name of picture 
					 StoreFileInDownloads.store(barr,imagename);
					 session.setAttribute("id",id);
					 session.setAttribute("username",username);
					 session.setAttribute("imagename",imagename);
					 AdminUseBean aub = new AdminUseBean();
					 aub.setName(rs.getString(2));
					 aub.setUsername(rs.getString(3));
					 aub.setEmail(rs.getString(4));
					 aub.setAge(rs.getString(5));
					 aub.setPhone(rs.getString(6));
					 aub.setAddress(rs.getString(7));
					 aub.setPassword(rs.getString(8));
					 aub.setCompanyname(rs.getString(9));
					 aub.setLocation(rs.getString(10));
					 aub.setJobpost(rs.getString(11));
					 aub.setImagename(imagename);
					 session.setAttribute("Admindata",aub);					
					 RequestDispatcher rd = request.getRequestDispatcher("adminsection.jsp");
					  rd.forward(request, response);
					  con.close();
					 }
					 else {
						 con.close();
						 request.setAttribute("message"," sorry ! you are not a valid Employee user");
						 RequestDispatcher rd = request.getRequestDispatcher("adminsection.jsp");
						  rd.forward(request, response);
					 }	 
					 
					 
			 
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
