<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/brad"
	user="root"
	password=""
/>
<sql:query var="result">
	SELECT * FROM food
</sql:query>

<sql:query var="result" dataSource="jdbc/brad">
	SELECT * FROM food
</sql:query>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<c:forEach items="${result.rows }" var="food">
		${food.name }<br />
	</c:forEach>
	
	
	</body>
</html>