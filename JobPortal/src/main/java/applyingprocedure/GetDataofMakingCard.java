package applyingprocedure;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import comman.CardData;
import databaseconnection.GetConnection;
public class GetDataofMakingCard {
	
	public static Vector<CardData>  cardsData(String adminid) {
		 Vector<String> v = new Vector<String>();
		 Vector<CardData> vec = new Vector<CardData>();
		Connection con = GetConnection.getConnection();
		String query = "select * from applied where adminid = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,adminid); 
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
			String cardid=rs.getString(2);	
				v.add(cardid);				
			}			
			for(String s :v) {
				String query1 ="select * from applying where cardid=?";
				PreparedStatement pstmt1 = con.prepareStatement(query1);
				 pstmt1.setString(1, s);
				ResultSet rs1 = pstmt1.executeQuery();
				while(rs1.next()) {
					CardData cd = new CardData();
					cd.adminid = rs1.getString(1);
					cd.cardid=rs1.getString(2);
					cd.companyname=rs1.getString(3);
					cd.location=rs1.getString(4);
					cd.experience=rs1.getString(5);
					cd.aboutskill=rs1.getString(6);
					cd.aboutpost=rs1.getString(7);
					cd.aboutcompany=rs1.getString(8);
					cd.cardimagename=rs1.getString(10);
					vec.add(cd);			
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
