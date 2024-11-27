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
	
	String name2 = "Eric";
	request.setAttribute("name", name2);
	
	String name3 = "Andy";
	session.setAttribute("name", name3);
	
	String name4 = "Mark";
	application.setAttribute("name", name4);

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
	PageContext Name: ${pageScope.name }<br />
	Request Name: ${requestScope.name }<br />
	Session Name: ${sessionScope.name }<br />
	Application Name: ${applicationScope.name }<br />
	
	
	</body>
</html>