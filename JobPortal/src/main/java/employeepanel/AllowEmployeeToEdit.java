package employeepanel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/AllowEmployeeToEdit")
public class AllowEmployeeToEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      response.setContentType("text/html");	      
		      HttpSession session = request.getSession(false);
				 if(session.isNew()) {
					 // when user is refresh on the page and if there is new session then this block is excute;
					 System.out.println("session is new ");
				 }
				String uploadspath = getServletConfig().getServletContext().getRealPath("uploads");
				  MultipartRequest mpr = new MultipartRequest(request, uploadspath,20*1024*1024);
				  String usergivenpass=mpr.getParameter("usergivenpassword");
				  EmployeeUseBean rb1 = (EmployeeUseBean)session.getAttribute("employeedata");
				  
				   // getting userid from session 
				     String userid = (String)session.getAttribute("id");
				     String realpass=rb1.getPassword();
				     if(!(usergivenpass.equals(realpass))) {
				    	  request.setAttribute("message","sorry! your password is incorrect");
				    	   RequestDispatcher rd =request.getRequestDispatcher("employeesection.jsp");
				    	   rd.forward(request, response);  	 
				     }
				  
				     else {
				    	 
				    	      EmployeeUseBean rb = new EmployeeUseBean();
				              String editimagename = mpr.getOriginalFileName("image");
				              String editresumename = mpr.getOriginalFileName("resume");		
				              rb.setName(mpr.getParameter("name"));     
				              rb.setUsername(mpr.getParameter("username"));
				              rb.setEmail(mpr.getParameter("email"));
				              rb.setPhone(mpr.getParameter("phone"));
				              rb.setAge(mpr.getParameter("age"));
				              rb.setAddress(mpr.getParameter("address"));
				              rb.setPassword(mpr.getParameter("password"));
				              rb.setCollege(mpr.getParameter("college"));
				              rb.setCourse(mpr.getParameter("course"));
				              rb.setTen(mpr.getParameter("ten"));
				              rb.setTwelve(mpr.getParameter("twelve"));
				              rb.setDegree(mpr.getParameter("degree"));
				              rb.setExperience(mpr.getParameter("experience"));
				              rb.setSkill(mpr.getParameter("skill"));
				              rb.setImagename(editimagename);
				              rb.setResumename(editresumename);
				              
				      // upadate this data by using EmployeeRegistrationDao class   '
				              
				             boolean check= EmployeeRegistrationDao.updatedata(rb,userid);
				             if(check) {
				            	 session.invalidate();
				            	 RequestDispatcher rd =request.getRequestDispatcher("loginemployee.jsp");
						    	   rd.forward(request, response);
				            	 
				             }
				             else {
				            	 request.setAttribute("message","sorry! there is any problem occure");
						    	   RequestDispatcher rd =request.getRequestDispatcher("employeesection.jsp");
						    	   rd.forward(request, response);
				            	 
				             }

				     }
		      

	}

}
