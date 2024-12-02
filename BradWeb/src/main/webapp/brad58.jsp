<%@page import="java.net.http.HttpResponse"%>
<%@page import="tw.brad.apis.MyTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = session.getAttribute("obj");
	if (obj == null){
		//response.sendRedirect("brad57.jsp");
		response.sendError(HttpServletResponse.SC_FORBIDDEN , "aaaaaa");
	}
	


	//MyTest myTest = (MyTest)obj;
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	I am brad58<hr />
	Lottery: ${obj.lottery }<br />
	<a href='brad59.jsp'>Logout</a>
	</body>
</html>