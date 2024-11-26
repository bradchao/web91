<%@page import="tw.brad.apis.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)request.getAttribute("name");
	Bike b1 = (Bike)request.getAttribute("bike");
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	I am Brad30<hr />
	Name = <%= name %><br />
	Bike speed = <%= b1.getSpeed() %>
	</body>
</html>