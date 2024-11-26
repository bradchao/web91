<%@page import="tw.brad.apis.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	Bike b1 = new Bike();
	b1.upSpeed().upSpeed().upSpeed().upSpeed();
	
	request.setAttribute("name", name);
	request.setAttribute("bike", b1);
	
	
%>    
<jsp:forward page="brad30.jsp"></jsp:forward>	
