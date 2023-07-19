package adminpanel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import employeepanel.EmployeeRegistrationDao;
import employeepanel.EmployeeUseBean;

@WebServlet("/AllowAdminToEdit")
public class AllowAdminToEdit extends HttpServlet {
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
			  String usergivenpass = mpr.getParameter("usergivenpassword");
			  
			            AdminUseBean aub1 =(AdminUseBean)session.getAttribute("Admindata");
			            
			            String userid = (String)session.getAttribute("id");
					     String realpass=aub1.getPassword();
					     if(!(usergivenpass.equals(realpass))) {
					    	  request.setAttribute("message","sorry! your password is incorrect");
					    	   RequestDispatcher rd =request.getRequestDispatcher("adminsection.jsp");
					    	   rd.forward(request, response);  	 
					     } 
					     else {
					    	 
				    	     AdminUseBean aub = new AdminUseBean();
				              String editimagename = mpr.getOriginalFileName("image");				              		
				              aub.setName(mpr.getParameter("name"));     
				              aub.setUsername(mpr.getParameter("username"));
				              aub.setEmail(mpr.getParameter("email"));
				              aub.setPhone(mpr.getParameter("phone"));
				              aub.setAge(mpr.getParameter("age"));
				              aub.setAddress(mpr.getParameter("address"));
				              aub.setPassword(mpr.getParameter("password"));
				              aub.setCompanyname(mpr.getParameter("companyname"));
				              aub.setLocation(mpr.getParameter("location"));
				              aub.setJobpost(mpr.getParameter("jobpost"));
				              aub.setPassword(mpr.getParameter("password"));
				              aub.setImagename(editimagename);
				              
				      // upadate this data by using EmployeeRegistrationDao class   '
				              
				             boolean check= AdminRegistrationDao.updatedata(aub, userid);
				             if(check) {
				            	 session.invalidate();
				            	 RequestDispatcher rd =request.getRequestDispatcher("loginadmin.jsp");
						    	   rd.forward(request, response);
				            	 
				             }
				             else {
				            	 request.setAttribute("message","sorry! there is any problem occure");
						    	   RequestDispatcher rd =request.getRequestDispatcher("adminsection.jsp");
						    	   rd.forward(request, response);
				            	 
				             }

				     }
					     
		
		
	}

}
