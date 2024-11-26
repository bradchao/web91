I am brad27<hr />
<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	out.print(String.format("%d + %d = %d", x, y, x+y));
%>
