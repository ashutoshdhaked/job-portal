package adminpanel;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import comman.GetId;
import databaseconnection.GetConnection;

@WebServlet("/AdminMultipart")
public class AdminMultipart extends HttpServlet {
	private static final long serialVersionUID = 1L;
      public static String uploadspath=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 HttpSession session = request.getSession(false);
	 if(session.isNew()) {
		 
	 }
		
		 uploadspath = getServletConfig().getServletContext().getRealPath("uploads");
		// session.setAttribute("uploadspath", uploadspath);
		File f = new File("uploads");
		if(f.exists()) {
			 f.mkdir();
		}
		MultipartRequest  mpr = new MultipartRequest(request,uploadspath,20*1024*1024);
		String imagename = mpr.getOriginalFileName("image");
		 AdminUseBean rb = new AdminUseBean();		
		rb.setName(mpr.getParameter("name"));
		rb.setUsername(mpr.getParameter("username"));
		rb.setEmail(mpr.getParameter("email"));
		rb.setAge(mpr.getParameter("age"));
		rb.setPhone(mpr.getParameter("phone"));
		rb.setPassword(mpr.getParameter("password"));
		rb.setAddress(mpr.getParameter("address"));
		rb.setCompanyname(mpr.getParameter("companyname"));
		rb.setLocation(mpr.getParameter("location"));
		rb.setJobpost(mpr.getParameter("jobpost"));
		rb.setImagename(imagename);
		
		
		String id = GetId.createId(mpr.getParameter("username")); /**getting the id which is (username+time)**/
		
		// Now we store the remain data before we store id so we can run update query on remain data;
		
		   boolean exist = CheckAdminExist.check(mpr.getParameter("email"));
		   if(exist) {
				  request.setAttribute("message", "user is already exist");
				 RequestDispatcher rd = request.getRequestDispatcher("sineupadmin.jsp");	
				 rd.forward(request, response);
	        	 
		   }
		   else {
		Connection con = GetConnection.getConnection();
		try {
		PreparedStatement pstmt	=con.prepareStatement("insert into admintable values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2,"*");pstmt.setString(3,"*");pstmt.setString(4,"*");pstmt.setString(5,"*");pstmt.setString(6,"*");pstmt.setString(7,"*");pstmt.setString(8,"*");pstmt.setString(9,"*");pstmt.setString(10,"*");
		 pstmt.setString(11,"*");pstmt.setString(12,null);pstmt.setString(13,"*");
		int i=pstmt.executeUpdate();
		
			if(i==1) {
				 boolean check = AdminRegistrationDao.updatedata(rb,id);
				 if(check) {
					 con.close();
				 RequestDispatcher rd = request.getRequestDispatcher("loginadmin.jsp");
				 rd.forward(request, response);
			}
			else {
				  con.close();
				  request.setAttribute("message", "sorry ! there is any problem to sineup user");
				 RequestDispatcher rd = request.getRequestDispatcher("sineupadmin.jsp");	
				 rd.forward(request, response);
			}
			
			
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		   }
		
	}

}
