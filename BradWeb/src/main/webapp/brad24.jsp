<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mesg = "";
	String errType = request.getParameter("errType");
	if (errType != null){
		if (errType.equals("1")){
			mesg = "Account EXIST!";
		}else if (errType.equals("2")){
			mesg = "Register FAILURE!";
		}
	}
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<script>
			function checkForm(){
				
				return true;
			}
		</script>
		<div><%= mesg %></div>
		<form action="Register" method="post" onsubmit="return checkForm();">
			Account: <input name="account" /><br />
			Password: <input type="password" name="passwd" /><br />
			Name: <input name="name" /><br />
			<input type="submit" value="Register" />
		</form>	
	
	</body>

</html>