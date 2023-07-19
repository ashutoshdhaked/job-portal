 package employeepanel;

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


@WebServlet("/EmployeeMultipart")
public class EmployeeMultipart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String uploadspath=null;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
		 if(session.isNew()) {
			 // when user is refresh on the page and if there is new session then this block is excute;
			 System.out.println("session is new ");
		 }
		 uploadspath = getServletConfig().getServletContext().getRealPath("uploads");
		File f = new File(uploadspath);
		if(f.exists()) {
			 f.mkdir();
		}
		   
		  MultipartRequest mpr = new MultipartRequest(request, uploadspath,20*1024*1024);
		  String imagename = mpr.getOriginalFileName("image");
		  String resumename = mpr.getOriginalFileName("resume");
		 EmployeeUseBean rb = new EmployeeUseBean();		
		rb.setName(mpr.getParameter("name"));
		rb.setUsername(mpr.getParameter("username"));
		rb.setEmail(mpr.getParameter("email"));
		rb.setAge(mpr.getParameter("age"));
		rb.setPhone(mpr.getParameter("phone"));
		rb.setAddress(mpr.getParameter("address"));
		rb.setPassword(mpr.getParameter("password"));
		rb.setCollege(mpr.getParameter("college"));
		rb.setCourse(mpr.getParameter("course"));
		rb.setTen(mpr.getParameter("ten"));
		rb.setTwelve(mpr.getParameter("twelve"));
		rb.setDegree(mpr.getParameter("degree"));
		rb.setExperience(mpr.getParameter("experience"));
		rb.setSkill(mpr.getParameter("skill"));
		rb.setImagename(imagename);
		rb.setResumename(resumename);
		
         String id = GetId.createId(mpr.getParameter("username")); /**getting the id which is ( username and time)**/
		
         System.out.println("id in EmployeeMultipart : "+id);
         
         
		// Now we store the remain data before we store id so we can run update query on remain data;
         boolean exist = CheckEmployeeExist.check(mpr.getParameter("email"));
         if(exist) {
        	
			  request.setAttribute("message", "user is already exist");
			 RequestDispatcher rd = request.getRequestDispatcher("sineupemployee.jsp");	
			 rd.forward(request, response);
        	 
         }
         else {
		Connection con = GetConnection.getConnection();
		try {
		PreparedStatement pstmt	=con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		 pstmt.setString(1,id);
		 pstmt.setString(2,"*");pstmt.setString(3,"*");pstmt.setString(4,"*");pstmt.setString(5,"*");pstmt.setString(6,"*");pstmt.setString(7,"*");pstmt.setString(8,"*");pstmt.setString(9,"*");pstmt.setString(10,"*");
		 pstmt.setString(11,"*");pstmt.setString(12,"*");pstmt.setString(13,"*");pstmt.setString(14,"*");pstmt.setString(15,"*");pstmt.setString(16,null);pstmt.setString(17,"*");pstmt.setString(18,null);pstmt.setString(19,"*");
		int i=pstmt.executeUpdate();
		
			if(i==1) {
			boolean check = EmployeeRegistrationDao.updatedata(rb,id);
			 if(check) {
				 con.close();
			 RequestDispatcher rd = request.getRequestDispatcher("loginemployee.jsp");
			 rd.forward(request, response);
			 }
			}			
			else {
				  con.close();
				  request.setAttribute("message", "sorry ! there is any problem to sineup user");
				 RequestDispatcher rd = request.getRequestDispatcher("sineupemployee.jsp");	
				 rd.forward(request, response);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
         }
		
	}

}
