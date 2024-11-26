package tw.brad.apis;

import java.sql.Connection;
import java.sql.DriverManager;

public class MemberDB {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost/brad";
	private static final String USER = "root";
	private static final String PASSWD = "";
	
	private static final String SQL_CHECK = "SELECT count(account) count FROM member WHERE account = ?";
	private static final String SQL_INSERT = "INSERT INTO member (account,passwd,name) VALUES (?,?,?)";
	
	private Connection conn;
	
	public MemberDB() throws Exception {
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, USER, PASSWD);
	}
	
	public boolean isAccountExist(String account) {
		
		
		
		return true;
	}
	
	public boolean addMember(String account, String passwd, String name) {
		return true;
	}
}
