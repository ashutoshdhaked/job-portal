package employeepanel;

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

@WebServlet("/EmployeeLogin")
public class EmployeeLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.isNew()) {
			
		}
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Connection con = GetConnection.getConnection();
		String query ="select * from employee where email= ? and password=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			   pstmt.setString(1,email);
			   pstmt.setString(2,password);
			 ResultSet rs = pstmt.executeQuery();
			 if(rs.next()) {
				String id= rs.getString(1);
				String username =rs.getString(3);
				 // getting picture's bytes from database
				Blob b = rs.getBlob(16);
				byte[] barr = b.getBytes(1,(int) b.length()); 
				String imagename = rs.getString(17);  // getting name of picture 
				 StoreFileInDownloads.store(barr,imagename);
				 
				 Blob b2 = rs.getBlob(18);
					byte[] barr2 = b2.getBytes(1,(int) b.length()); 
					String resumename = rs.getString(19);  // getting name of resume
					 StoreFileInDownloads.store(barr2,resumename);
				 session.setAttribute("id",id);
				 session.setAttribute("username",username);
				 session.setAttribute("imagename",imagename);
					 
					 
				 EmployeeUseBean emprb = new EmployeeUseBean();
				  emprb.setUsername(rs.getString(3));
				  emprb.setName(rs.getString(2));
				  emprb.setAge(rs.getString(5));
				  emprb.setAddress(rs.getString(7));
				  emprb.setEmail(rs.getString(4));
				  emprb.setImagename(rs.getString(17));
				  emprb.setCourse(rs.getString(10));
				  emprb.setPhone(rs.getString(6));
				  emprb.setExperience(rs.getString(14));
				  emprb.setResumename(rs.getString(19));
				  emprb.setSkill(rs.getString(15));
				  emprb.setTen(rs.getString(11));
				  emprb.setTwelve(rs.getString(12));
				  emprb.setDegree(rs.getString(13));
				  emprb.setCollege(rs.getString(9));
				  emprb.setPassword(rs.getString(8));
				  session.setAttribute("employeedata",emprb);				 
			  RequestDispatcher rd = request.getRequestDispatcher("employeesection.jsp");
			  rd.forward(request, response);
			  con.close();
			 }
			 else {
				 con.close();
				 request.setAttribute("message"," sorry ! you are not a valid Employee user");
				 RequestDispatcher rd = request.getRequestDispatcher("employeesection.jsp");
				  rd.forward(request, response);
			 }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
