<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:catch var="error">
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/brad", "root", "");
	String sql = "INSERT INTO cust (name,tel,birthday) VALUES (?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "aaaaaa");
	pstmt.setString(2, "0912-123456");
	pstmt.setString(3, "1999-01-31");
	int n = pstmt.executeUpdate();
	pageContext.setAttribute("n", n);
%>    
</c:catch>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<c:if test="${!empty error }">Server Busy: ${error }</c:if>
	<c:choose>
		<c:when test="${n > 0 }">Success</c:when>
		<c:otherwise>Failure</c:otherwise>
	</c:choose><br />
	${n }
	
	
	
	
	</body>
</html>