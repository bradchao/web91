<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:if test="${empty member.account }">
	<c:redirect url="login.jsp" />
</c:if>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<h1>Brad Big Company</h1>
	<hr />
	Welcome, ${member.name }<br />
	<img alt="no icon" src="data:image/png; base64, ${member.icon }">
	<a href="logout.jsp">Logout</a>
	<hr />
	
	
	</body>
</html>