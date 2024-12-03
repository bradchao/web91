<%@page import="java.util.SortedMap"%>
<%@page import="java.util.Base64"%>
<%@page import="jakarta.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="tw.brad.apis.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="java.sql.*"%>   
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:if test="${empty member.account }">
	<c:redirect url="login.jsp" />
</c:if> 

<c:choose>
	<c:when test="${!empty param.editid  }">

		<sql:query var="rs" dataSource="jdbc/brad">
			SELECT * FROM member WHERE id = ?
			<sql:param>${param.editid }</sql:param> 
		</sql:query>
		<c:if test="${rs.rowCount == 0 }"><c:redirect url="main.jsp" /></c:if>
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
			session.setAttribute("editid", (Long)row.get("id"));
		%>

	
	</c:when>
	<c:otherwise>
		<sql:update dataSource="jdbc/brad" var="n">
			UPDATE member SET account = ?, passwd = ?, name = ? WHERE id = ?
			<sql:param>${param.account }</sql:param>
			<sql:param>${BCrypt.hashpw(param.passwd, BCrypt.gensalt()) }</sql:param>
			<sql:param>${param.name }</sql:param>
			<sql:param>${editid }</sql:param>
		</sql:update>
		<%
			session.removeAttribute("editid");
		%>
		<c:redirect url="main.jsp" />
			
	</c:otherwise>
</c:choose>



 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	Edit Member<hr />
	<form action="editMember.jsp" method="post">
		Account: <input name="account" value="${rs.rows[0].account }" /><br />
		Password: <input type="password" name="passwd" /><br />
		Name: <input name="name" value="${rs.rows[0].name }" /><br />
		Icon: <img src="data:image/png; base64, ${rs.rows[0].icon }" /><br />
		<input type="submit" value="Update" />
	</form>		
	
	
	</body>
</html>