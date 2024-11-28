package tw.brad.apis;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.SortedMap;
import java.util.TreeMap;

import org.json.JSONArray;
import org.json.JSONObject;

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
	public static String calc(String sx, String sy, String op) {
		try {
			int x = Integer.parseInt(sx);
			int y = Integer.parseInt(sy);
			StringBuffer sb = new StringBuffer();
			switch(op) {
				case "1": sb.append(x + y); break;
				case "2": sb.append(x - y); break;
				case "3": sb.append(x * y);break;
				case "4": 
					sb.append(x  / y).append(" ...... ").append(x % y);
					break;
			}
			
			return sb.toString();
			
		}catch(Exception e) {
			return "";
		}
	}
	
	public static String createScore() {
		return (int)(Math.random()*101)+"";
	}
	
	public static SortedMap[] parseGift(String json) {
		JSONArray root = new JSONArray(json);
		
		int len = root.length(); 
		System.out.println(len);
		SortedMap<String,String>[] allgift = new TreeMap[len];
		
		for (int i=0; i<len; i++) {
			JSONObject gift = root.getJSONObject(i);
			
			TreeMap<String, String> map = new TreeMap<String, String>();
			map.put("name", gift.getString("Name"));
			map.put("feature", gift.getString("Feature"));
			map.put("pic", gift.getString("Column1"));
			
			allgift[i] = map;
		}
		
		return allgift;
	}
	
	
}
