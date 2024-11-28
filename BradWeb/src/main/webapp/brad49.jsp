<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.brad.apis.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:import url="https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx" var="data"></c:import>    

<c:catch var='err'>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/brad"
		user="root"
		password=""
	/>
	<sql:update>
		DELETE FROM gift
	</sql:update>
	<sql:update>
		ALTER TABLE gift AUTO_INCREMENT = 1
	</sql:update>
</c:catch>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	
	<c:set var="allgift" value="${BradUtils.parseGiftV2(data) }"></c:set>
	
	<c:catch var="err2">
		<c:forEach items="${allgift }" var="gift">
				<sql:update>
					INSERT INTO gift (name,feature,pic) VALUES (?,?,?)
					<sql:param>${gift.name }</sql:param>
					<sql:param>${gift.feature }</sql:param>
					<sql:param>${gift.pic }</sql:param>
				</sql:update>
		</c:forEach>
	</c:catch>
	1. ${err }<br />
	2. ${err2 }<br />
	
	</body>
</html>