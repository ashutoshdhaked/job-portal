package applyingprocedure;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import comman.CardData;
import databaseconnection.GetConnection;

public class GetDataOfCreateCard {

	public static Vector<CardData> getdata(String adminid){
		
		Vector<CardData> vec = new Vector<CardData>();
		
		String query = "select * from applying where adminid=?";
		Connection con = GetConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(query);
			pstmt.setString(1,adminid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				CardData cd = new CardData();
				cd.adminid = rs.getString(1);
				cd.cardid=rs.getString(2);
				cd.companyname=rs.getString(3);
				cd.location=rs.getString(4);
				cd.experience=rs.getString(5);
				cd.aboutskill=rs.getString(6);
				cd.aboutpost=rs.getString(7);
				cd.aboutcompany=rs.getString(8);
				cd.cardimagename=rs.getString(10);
				vec.add(cd);						
			}
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
		return vec;	
	}
	
	
}
