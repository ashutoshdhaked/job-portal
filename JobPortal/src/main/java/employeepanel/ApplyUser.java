package employeepanel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import databaseconnection.GetConnection;

public class ApplyUser {
	public static boolean apply(String adminid,String userid,String cardid) {
		
//		System.out.println(adminid);
//		System.out.println(userid);
//		System.out.println(cardid);
		
		Connection con = GetConnection.getConnection();
		String query = "select * from applied where userid=?";
		String query1="insert into applied values(?,?,?)";
		boolean check = false;
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,userid);
			PreparedStatement pstmt1 = con.prepareStatement(query1);
			pstmt1.setString(1,adminid);
			pstmt1.setString(2,cardid);
			pstmt1.setString(3,userid);
			ResultSet rs =pstmt.executeQuery();
			while(rs.next()) {
				String getcardid = rs.getString(2);
				if(getcardid.equals(cardid)) {
					check = true;
					return false;
				}
				
			}
			if(!check) {
			 int i= pstmt1.executeUpdate();
			 if(i==1) {
				 System.out.println("successfull update ");
				 return true;
			 }
				
			}
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
	
		}
		return false;
	}
}
