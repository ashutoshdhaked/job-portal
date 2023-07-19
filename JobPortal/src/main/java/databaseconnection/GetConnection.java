package databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection implements DataBaseInfo {
   public static Connection  getConnection() {
	   Connection con =null;
   	try {
   	 Class.forName(DATABASE_CLASS);
   	 con= DriverManager.getConnection(DATABASE_URL,DATABASE_NAME,DATABASE_PASSWORD);
   	}
   	catch(Exception e) {
   		e.printStackTrace();
   	}
   	return con;
   }
	
}
