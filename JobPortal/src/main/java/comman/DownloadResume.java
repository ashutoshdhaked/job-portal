package comman;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DownloadResume")
public class DownloadResume extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/octet-stream");
		HttpSession session = request.getSession();
        String resumename = (String) session.getAttribute("resumename");
      //  System.out.println(resumename);
        File f = new File(resumename);
        String filename = f.getName();
        OutputStream o = response.getOutputStream();
        response.setHeader("content-disposition","attachment;filename ="+filename);
        
       // String s= getServletConfig().getServletContext().getRealPath("downloads");
        
         String s="D:\\JobPortal\\src\\main\\webapp\\downloads\\"+filename;
       // System.out.println(" s value is : "+s);
        
        FileInputStream fin = new FileInputStream(s);
        byte b[]= new byte[fin.available()];
        fin.read(b);   
        o.write(b);
        o.close();
        fin.close();
		
	}

}
