<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:import url="https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx" var="data"></c:import>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	${data }
	</body>
</html>