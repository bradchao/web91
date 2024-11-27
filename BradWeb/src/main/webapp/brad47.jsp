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
<c:set var="sql">SELECT * FROM food</c:set>
<sql:query var="rs">
	${sql }
</sql:query>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		共 ${rs.rowCount } 筆資料<hr />
		<c:forEach items="${rs.columnNames }" var="fieldName">
			${fieldName }<br />
		</c:forEach>
		<hr />
		<table border='1' width='100%'>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Tel</th>
				<th>Address</th>
				<th>Feature</th>
			</tr>
			<c:forEach items="${rs.rows }" var="food">
				<tr>
					<td>${food.id }</td>
					<td>${food.name }</td>
					<td>${food.tel }</td>
					<td>${food.addr }</td>
					<td>${food.feature }</td>
				</tr>
			</c:forEach>
		
		
		
		</table>
	
	
	
	</body>
</html>