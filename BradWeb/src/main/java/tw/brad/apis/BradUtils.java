package tw.brad.apis;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.InetAddress;
import java.net.URL;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
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
		TreeMap<String,String>[] allgift = new TreeMap[len];
		
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
	
	public static List<Map<String,String>> parseGiftV2(String json){
		List<Map<String, String>> allgift = new LinkedList<>();
		JSONArray root = new JSONArray(json);
		for (int i=0; i<root.length(); i++) {
			JSONObject gift = root.getJSONObject(i);
			
			Map<String, String> map = new HashMap<>();
			
			map.put("name", gift.getString("Name"));
			map.put("feature", gift.getString("Feature"));
			map.put("pic", gift.getString("Column1"));
			
			allgift.add(map);
		}
		
		return allgift;
	}
	
	public static String order2JSON(SortedMap[] rows) {
		JSONObject root = new JSONObject();
		if (rows.length > 0) {
			root.put("Customer", rows[0].getOrDefault("CustomerID", ""));
			root.put("Employee", rows[0].getOrDefault("EmployeeID", ""));
			
			JSONArray details = new JSONArray();
			for (int i=0; i<rows.length; i++) {
				SortedMap<String, String> row = rows[i];
				JSONObject detail = new JSONObject();
				detail.put("ProductID", row.getOrDefault("ProductID", ""));
				detail.put("ProductName", row.getOrDefault("ProductName", ""));
				detail.put("UnitPrice", row.getOrDefault("UnitPrice", ""));
				detail.put("Quantity", row.getOrDefault("Quantity", ""));
				
				details.put(detail);
			}
			
			root.put("details", details);
		}
		return root.toString();
	}
	
	
	
}
