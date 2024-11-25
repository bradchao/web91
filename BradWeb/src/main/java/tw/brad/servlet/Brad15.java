package tw.brad.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.brad.apis.Bike;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Brad15")
public class Brad15 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String mesg = String.format("x = %s; y = %s<br />", x, y);
		
		String name = (String)request.getAttribute("name");
		Integer age =  (Integer)request.getAttribute("age");
		String mesg2 = String.format("name = %s; age = %d<br />", name, age);
		
		Bike b1 = (Bike)request.getAttribute("bike");
		String mesg3 = String.format("Bike Speed = %s", b1.getSpeed());
		
		b1.upSpeed().upSpeed().upSpeed().upSpeed();
		
		PrintWriter out = response.getWriter();
		out.print("I am Brad15<br />");
		out.print(mesg);
		out.print(mesg2);
		out.print(mesg3);
	}

}
