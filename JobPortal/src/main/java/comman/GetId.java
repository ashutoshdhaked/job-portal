package comman;

import java.util.Date;

public class GetId {
	public static String createId(String name) {
		Date d = new Date();
		 String id = name+""+d.getTime();
		id.replaceAll("\\s", "");
		return id;		
	}

}
