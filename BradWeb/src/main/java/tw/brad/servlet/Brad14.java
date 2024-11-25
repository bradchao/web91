package tw.brad.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.brad.apis.Bike;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Brad14")
public class Brad14 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Brad15");
		
		request.setAttribute("name", "Brad");
		request.setAttribute("age", 18);
		
		Bike b1 = new Bike();
		request.setAttribute("bike", b1);
		b1.upSpeed().upSpeed().upSpeed().upSpeed();
	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>Brad</h1>");
		out.print("<hr />");
		dispatcher.include(request, response);
		out.print("<hr />");
		out.printf("Brad14: %f", b1.getSpeed());
		
		response.flushBuffer();
	}

}
