<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:catch var='err'>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/brad"
		user="root"
		password=""
	/>
</c:catch>

<c:set var="rpp">10</c:set>

<c:set var="sql">SELECT * FROM gift</c:set>
<sql:query var="result">
	${sql }
</sql:query>
${result.rowCount / rpp + 1 }
<c:set var="total">${BradUtils.toTotal(result.rowCount, rpp) }</c:set>


<c:set var="page">${empty param.page?1:param.page }</c:set>
<c:set var="prev">${page==1? 1 : page - 1 }</c:set>
<c:set var="next">${page == total? page : page + 1 }</c:set>
<c:set var="start">${(page - 1) * rpp }</c:set>

<c:set var="sql">SELECT * FROM gift LIMIT ${start }, ${rpp }</c:set>
<sql:query var="result">
	${sql }
</sql:query>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	共 ${result.rowCount } 筆資料<hr />
	目前頁: ${page } 頁 <a href='?page=${prev }'>上一頁</a> | <a href='?page=${next }'>下一頁</a> 
	<table border="1" width="100%">
		<tr>
			<th>ID</th>
			<th>名稱</th>
			<th>特色</th>
		</tr>
		
		<c:forEach var="gift" items="${result.rows }">
			<tr>
				<td>${gift.id }</td>
				<td>${gift.name }</td>
				<td>${gift.feature }</td>
			</tr>
		</c:forEach>
		
	</table>
	
	
	</body>
</html>