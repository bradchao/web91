<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="tw.brad.apis.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="java.sql.*"%>   
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:if test="${empty member.account }">
	<c:redirect url="login.jsp" />
</c:if> 

<c:if test="${!empty param.editid  }">
	<sql:query var="rs" dataSource="jdbc/brad">
		SELECT * FROM member WHERE id = ?
		<sql:param>${param.editid }</sql:param> 
	</sql:query>
	<c:if test="${rs.rowCount == 0 }"><c:redirect url="main.jsp" /></c:if>
	<%
	
	
	%>
</c:if> 




 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	Edit Member<hr />
	<form action="editMember.jsp" method="post">
		Account: <input name="account" id="account" value="${rs.rows[0].account }" /><br />
		Password: <input type="password" name="passwd" /><br />
		Name: <input name="name" value="${rs.rows[0].name }" /><br />
		Icon: <img src="" /><br />
		<input type="submit" value="Update" />
	</form>		
	
	
	</body>
</html>