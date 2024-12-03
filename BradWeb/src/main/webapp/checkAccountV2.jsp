<%@page import="java.util.*"%>
<%@page import="jakarta.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.brad.apis.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:if test="${empty param.account }">
	<c:redirect url="login.jsp" />
</c:if>
<sql:query var="rs" dataSource="jdbc/brad">
	SELECT * FROM member WHERE account = ?
	<sql:param>${param.account }</sql:param>
</sql:query>
<c:if test="${rs.rowCount == 0 }">
	<c:redirect url="login.jsp" />
</c:if>
<c:choose>
	<c:when test="${BCrypt.checkpw(param.passwd, rs.rows[0].passwd) }">
		<%
			// rs
			Result rs = (Result)pageContext.getAttribute("rs");
			SortedMap row = rs.getRows()[0];
			try{
				byte[] icon = (byte[])row.get("icon");
				String iconBase64 =  Base64.getEncoder().encodeToString(icon);
				
				row.put("icon", iconBase64);
			}catch(Exception e){
				row.put("icon", "");
			}
		%>	
	
	
		<c:set var="member" value="${rs.rows[0] }" scope="session" />
		<c:redirect url="main.jsp" />
	</c:when>
	<c:otherwise>
		<c:redirect url="login.jsp" />
	</c:otherwise>
</c:choose>
    