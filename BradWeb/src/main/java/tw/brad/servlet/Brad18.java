package tw.brad.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.brad.apis.MyModel;

import java.io.IOException;
import java.io.PrintWriter;
/*
 * Controller
 */
@WebServlet("/Brad18")
public class Brad18 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		
		// 運算Model
		try {
			MyModel myModel = new MyModel(x, y);
			String result = myModel.plus();
			request.setAttribute("x", x);
			request.setAttribute("y", y);
			request.setAttribute("result", result);
		} catch (Exception e) {
			request.setAttribute("x", "");
			request.setAttribute("y", "");
			request.setAttribute("result", "");
			
		}
	
		// 呈現View
		RequestDispatcher dispatcher = request.getRequestDispatcher("Brad19");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		dispatcher.forward(request, response);
	}

}
