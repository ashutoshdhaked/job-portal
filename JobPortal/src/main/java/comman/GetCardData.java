package comman;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import databaseconnection.GetConnection;

public class GetCardData {
	
	
    public static Vector<CardData> getdata() {
    	
    	Vector<CardData> v = new Vector<CardData>();
    	String query = "select * from applying";
    	Connection con = GetConnection.getConnection();
        try {
			PreparedStatement pstmt = con.prepareStatement(query);
		    ResultSet rs= pstmt.executeQuery();
		  while(rs.next()) {
			  CardData cd = new CardData();
			  cd.adminid = rs.getString(1);
			  cd.cardid = rs.getString(2);
			  cd.companyname = rs.getString(3);
			  cd.location =rs.getString(4);
			  cd.experience=rs.getString(5);
			  cd.aboutskill=rs.getString(6);
			  cd.aboutpost=rs.getString(7);
			  cd.aboutcompany=rs.getString(8);
			  Blob blob = rs.getBlob(9);
			  byte barr[]= blob.getBytes(1,(int)blob.length());
			  cd.cardimagename=rs.getString(10);
			  StoreFileInDownloads.store(barr,rs.getString(10));
			  v.add(cd);
			  
		  }	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    	   	
    	
    	return v;
    }
}


