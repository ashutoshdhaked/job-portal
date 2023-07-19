package applyingprocedure;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import databaseconnection.GetConnection;

public class GetDataOfUserForAdmin {
	public static Vector<UserData> getdata(String cardid) {
		Vector<UserData> vec = new Vector<UserData>();
		Vector<String> v = new Vector<String>();
		Connection con = GetConnection.getConnection();
		String query = "select * from applied where cardid=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			 String output = cardid.replace("'", "");
			pstmt.setString(1,output);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {			
			     String userid = rs.getString(3);
				v.add(userid);
				
			}
			for(String id :v) {
				String query1 = "select * from employee where id=?";
				PreparedStatement pstmt1 = con.prepareStatement(query1);
				pstmt1.setString(1,id);
				ResultSet rs1 = pstmt1.executeQuery();
				while(rs1.next()) {
					UserData ud = new UserData();
					         ud.name = rs1.getString(2);
					         ud.username  = rs1.getString(3);
					         ud.email = rs1.getString(4);
					         ud.age = rs1.getString(5);
					         ud.phone = rs1.getString(6);
					         ud.address = rs1.getString(7);
					         ud.collegename = rs1.getString(9);
					         ud.stream = rs1.getString(10);
					         ud.ten = rs1.getString(11);
					         ud.twelve = rs1.getString(12);
					         ud.degree = rs1.getString(13);
					         ud.experience = rs1.getString(14);
					         ud.skill = rs1.getString(15);
					         ud.imagename = rs1.getString(17);
					         ud.resumename = rs1.getString(19);
					         vec.add(ud);
					
				}
			
			}
			con.close();	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
		
	}

}
