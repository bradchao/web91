<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.brad.apis.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:if test="${pageContext.request.method == 'POST' }">  
	<c:catch var='err'>
		<sql:update var="result" dataSource="jdbc/brad">
			INSERT INTO gift (name,feature,pic) VALUES (?,?,?)
			<sql:param>${param.name }</sql:param>
			<sql:param>${param.feature }</sql:param>
			<sql:param>${param.pic }</sql:param>
		</sql:update>
		${result }
	</c:catch>
</c:if>
