<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.brad.apis.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<c:catch var='err'>
	<sql:query var="result" dataSource="jdbc/brad">
		SELECT * FROM gift WHERE name LIKE ? OR feature LIKE ?
		<sql:param>%${param.search }%</sql:param>
		<sql:param>%${param.search }%</sql:param>
	</sql:query>
	${BradUtils.gift2JSON(result.rows) }	
</c:catch>
${err }