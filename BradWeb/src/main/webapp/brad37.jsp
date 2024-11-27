<%@page import="tw.brad.apis.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name1 = "Brad";
	pageContext.setAttribute("name", name1);
	
	Bike b1 = new Bike();
	pageContext.setAttribute("bike", b1);
	b1.upSpeed().upSpeed().downSpeed();
	b1.upSpeed();b1.upSpeed();b1.upSpeed();
	

%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	Name: ${name }<br />
	Bike: ${bike }<br />
	</body>
</html>