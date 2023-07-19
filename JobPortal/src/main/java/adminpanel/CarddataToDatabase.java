package adminpanel;

import java.io.FileInputStream;
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


@WebServlet("/CarddataToDatabase")
public class CarddataToDatabase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session.isNew()) {
			
		}
		else {
		
		String s = getServletConfig().getServletContext().getRealPath("uploads");
		
		MultipartRequest mpr = new MultipartRequest(request, s,10*1024*1024);
		String cardimagename = mpr.getOriginalFileName("cardimage");
		String cardcompanyname=mpr.getParameter("cardcompanyname");
		String cardexperience=mpr.getParameter("cardexperience");
		String cardlocation=mpr.getParameter("cardlocation");
		String cardskill=mpr.getParameter("cardskill");
		String cardjobpost=mpr.getParameter("cardjobpost");
		String cardcompany=mpr.getParameter("cardcompany");
		
		String id = (String) session.getAttribute("id");
		//System.out.println(id);
		
		Connection  con = GetConnection.getConnection();
		String query="insert into applying values(?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt =con.prepareStatement(query);
			pstmt.setString(1,id);
			
			String cardid=GetId.createId("ASTDHK");
			pstmt.setString(2, cardid);
			pstmt.setString(3,cardcompanyname);
			pstmt.setString(4,cardlocation);
			pstmt.setString(5,cardexperience);
			pstmt.setString(6,cardskill);
			pstmt.setString(7,cardjobpost);
			pstmt.setString(8,cardcompany);
			String file = s+"//"+cardimagename;
			FileInputStream fin = new FileInputStream(file);
			pstmt.setBinaryStream(9,fin,fin.available());
			pstmt.setString(10,cardimagename);
			int i= pstmt.executeUpdate();
			if(i==1) {
			        con.close();
				request.setAttribute("message","your card is successfully created");
				RequestDispatcher rd =request.getRequestDispatcher("adminsection.jsp");
				rd.forward(request, response);
			}
			else {
				con.close();
				request.setAttribute("message","sorry your card is not created there any issue");
				RequestDispatcher rd =request.getRequestDispatcher("createcard.jsp");
				rd.forward(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		}
	}

}
