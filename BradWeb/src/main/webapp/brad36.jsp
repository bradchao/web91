<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//if (request.getMethod().equals("POST")) response.sendError(403); 

//	String account = request.getParameter("account");
	//String[] habbits = request.getParameterValues("habbit");

	//pageContext.getRequest()
	//Locale loc = request.getLocale();
	//String lang = loc.getDisplayLanguage();
	
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	I am brad36<hr />
	Method: ${pageContext.request.method }<br /> 
	Locale: ${pageContext.request.locale }<br />
	Language: ${pageContext.request.locale.displayLanguage }<br />
	Account: ${param.account }<br />
	Habbits:<br />
		1. ${paramValues.habbit[0] }<br />
		2. ${paramValues.habbit[1] }<br />
		3. ${paramValues.habbit[2] }<br />
		4. ${paramValues.habbit[3] }<br />
		5. ${paramValues.habbit[4] }<br />
		6. ${paramValues.habbit[5] }<br /> 
	
	
	
	
	</body>
</html>