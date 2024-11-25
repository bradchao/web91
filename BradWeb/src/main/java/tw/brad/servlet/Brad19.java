package tw.brad.servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.brad.apis.BradUtils;

@WebServlet("/Brad19")
public class Brad19 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String x = (String)request.getAttribute("x");
		String y = (String)request.getAttribute("y");
		String result = (String)request.getAttribute("result");
		String view = (String)request.getAttribute("view");
		
		try {
			String webPage = BradUtils.loadView(view);
			String webView = String.format(webPage, x, y, result);
			response.getWriter().print(webView);
		}catch(Exception e) {
			response.getWriter().print("ERROR!");
		}
	}

}
