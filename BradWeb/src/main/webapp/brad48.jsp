<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:catch var='err'>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/brad"
		user="root"
		password=""
	/>
	<sql:update>
		UPDATE cust SET name=?, tel=? WHERE id = ?
		<sql:param>bbbok</sql:param>
		<sql:param>13579</sql:param>
		<sql:param>6</sql:param>
	</sql:update>


</c:catch>
${err }
