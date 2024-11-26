package tw.brad.apis;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDB {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost/brad";
	private static final String USER = "root";
	private static final String PASSWD = "";
	
	private static final String SQL_CHECK = "SELECT count(account) count FROM member WHERE account = ?";
	private static final String SQL_INSERT = "INSERT INTO member (account,passwd,name) VALUES (?,?,?)";
	private static final int INSERT_ACCOUNT = 1;
	private static final int INSERT_PASSWD = 2;
	private static final int INSERT_NAME = 3;
	
	private Connection conn;
	
	public MemberDB() throws Exception {
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, USER, PASSWD);
	}
	
	public boolean isAccountExist(String account) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL_CHECK);
			pstmt.setString(1, account);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt("count") != 0;
		}catch(Exception e) {
			System.out.println(e);
			return true;
		}
	}
	
	public boolean addMember(String account, String passwd, String name) 
			throws Exception {
		PreparedStatement pstmt = conn.prepareStatement(SQL_INSERT);
		pstmt.setString(INSERT_ACCOUNT, account);
		pstmt.setString(INSERT_NAME, name);
		pstmt.setString(INSERT_PASSWD, BCrypt.hashpw(passwd, BCrypt.gensalt()));
		
		return pstmt.executeUpdate() > 0;
	}
}
