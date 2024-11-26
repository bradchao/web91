package tw.brad.apis;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

public class BradUtils {
	public static String loadView(String view) throws Exception {
		String source = 
			"C:\\Users\\User\\git\\repository\\BradWeb\\src\\main\\webapp\\views\\%s.html";
		String file = String.format(source, view);
		//System.out.println(file);
		File html = new File(file);
		byte[] buf = new byte[(int)html.length()];
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(html));
		bin.read(buf);
		
		String content = new String(buf);
		return content;
	}
	public static String calc(String sx, String sy) {
		try {
			int x = Integer.parseInt(sx);
			int y = Integer.parseInt(sy);
			int r = x + y;
			return r+"";
		}catch(Exception e) {
			return "";
		}
	}
}
