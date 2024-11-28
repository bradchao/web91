<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<c:catch var="err">
		<sql:setDataSource
			driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost/brad"
			user="root"
			password=""
			/>
		<sql:update var="n">
			UPDATE cust SET name='bbbbb', tel='7654321' WHERE id = 6
		</sql:update>
		<sql:update var="n1">
			DELETE FROM cust WHERE id >= 8
		</sql:update>		
	</c:catch>
	${err }<br />
	n = ${n }<br />
	n1 = ${n1 }
	
	
	
		
	</body>
</html>