<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="brad" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<table width='100%' border='1'>
		<tr>
			<th>Name</th>
			<th>Price</th>
		</tr>
		
		<brad:item pname="iPhone" price='30,000' />
		<brad:item pname="mouse" price='300' />
		<brad:item pname="keyboard" price='1,000' />
		
	</table>
	
	</body>
</html>