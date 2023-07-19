package adminpanel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import databaseconnection.GetConnection;

public class CheckAdminExist {
	
	
	public static boolean check(String email) {
		String s ="select * from admintable where id = ?"; 
		Connection con = GetConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(s);
	         pstmt.setString(1,email);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

}
