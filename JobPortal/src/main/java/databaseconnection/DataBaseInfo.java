package databaseconnection;

public interface DataBaseInfo {
	public static final String DATABASE_CLASS="oracle.jdbc.OracleDriver";
	public static final String DATABASE_URL="jdbc:oracle:thin:@localhost:1521:xe";
	public static final String DATABASE_NAME="system";
	public static final String DATABASE_PASSWORD="12345";
	
}
