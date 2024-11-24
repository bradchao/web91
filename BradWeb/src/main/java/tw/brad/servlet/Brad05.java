package tw.brad.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Brad05")
public class Brad05 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String r = "";
		if (x != null || y != null) {
			try {
				int intX = Integer.parseInt(x);
				int intY = Integer.parseInt(y);
				int intR = intX + intY;
				r += intR;
			}catch(Exception e) {}
		}else {
			x = y = "";
		}
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.printf("<form action='Brad05' method='get'>\n")
			.printf("<input type='number' name='x' value='%s' />\n", x)
			.printf("<select>")
			.printf("<option>+</option>")
			.printf("<option>-</option>")
			.printf("<option>x</option>")
			.printf("<option>/</option>")
			.printf("</select>")
			.printf("<input type='number' name='y' value='%s' />\n", y)
			.printf("<input type='submit' value='=' />\n")
			.printf("<span>%s</span>",r)
			.printf("</form>\n");
		
		
	}

}
