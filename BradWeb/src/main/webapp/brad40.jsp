<%@page import="tw.brad.apis.Bike"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] names = {"brad","peter","kevin","vivian"};
	pageContext.setAttribute("names", names);
	names[2] = "john";
	
	LinkedList<Integer> lottery = new LinkedList<>();
	lottery.add(12);lottery.add(34);lottery.add(41);lottery.add(77);
	pageContext.setAttribute("lottery", lottery);
	
	HashMap<String,Object> person = new HashMap<>();
	person.put("name", "Brad");
	person.put("age", 18);
	person.put("weight", 79.123);
	person.put("gender", true);
	person.put("bike", new Bike());
	pageContext.setAttribute("person", person);
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	Names[2]: ${names[2] }<br />
	Lottery[2]: ${lottery[2] }<br />
	Person: ${person.name }<br />
	${person.name }<br />
	${person.age }<br />
	${person.weight }<br />
	${person.gender }<br />
	${person.bike }<br />
	
	
	</body>
</html>