<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.SortedMap"%>
<%@page import="jakarta.servlet.jsp.jstl.sql.Result"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<sql:query var="rs" dataSource="jdbc/brad">
	SELECT count(account) total FROM member WHERE account = ?
	<sql:param>${param.account }</sql:param>
</sql:query>
<%
	Result result = (Result)pageContext.getAttribute("rs");
	SortedMap[] datas = result.getRows();
	SortedMap data = datas[0];
	
	JSONObject root = new JSONObject();
	root.put("count", data.get("total"));
	
	pageContext.setAttribute("count", root);
%>
${count }