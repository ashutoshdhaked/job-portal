package comman;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetPathOfDownloads")
public class GetPathOfDownloads extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String path=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		path=getServletConfig().getServletContext().getRealPath("downloads");
	}

}
