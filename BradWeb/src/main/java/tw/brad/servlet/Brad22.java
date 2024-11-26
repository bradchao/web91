package tw.brad.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Brad22")
public class Brad22 extends HttpServlet {
	private Connection conn;
	
	public Brad22() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/brad", "root", "");
			System.out.println("Conn OK");
		} catch (Exception e) {
			System.out.println("ERROR");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		String key2 = "%" + key + "%";
		
		String sql = "SELECT * FROM food";
		if (key != null) {
			sql = "SELECT * FROM food WHERE name LIKE ? OR addr LIKE ? OR feature LIKE ?";
		}
		
		//-------------------------------
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<table border='1' width='100%'>");
		out.print("<tr><th>ID</th><th>Name</th><th>Feature</th><th>Addr.</th></tr>");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			if (key != null) {
				pstmt.setString(1, key2);
				pstmt.setString(2, key2);
				pstmt.setString(3, key2);
			}
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		out.print("</table>");
		response.flushBuffer();
		
		
		
		
		
		
		
		
		
		
	}

}
