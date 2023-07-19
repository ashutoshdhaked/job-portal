package comman;

import java.io.FileOutputStream;

public class StoreFileInDownloads {
	public static void store(byte b[] ,String name) {
    // String downloadspath=GetPathOfDownloads.path;
	/* here for temporary we are not using this but at the time of hosting we use it */
		
		String Path="D:\\JobPortal\\src\\main\\webapp\\downloads";
		try {
			FileOutputStream fout = new FileOutputStream(Path+"\\"+name);
			fout.write(b);
			fout.close();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
