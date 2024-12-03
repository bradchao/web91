package tw.brad.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet("/AddMember")
@MultipartConfig
public class AddMember extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		// 1. 處理 Part
		Part part = request.getPart("icon");
		
		byte[] buf = part.getInputStream().readAllBytes();
		request.setAttribute("icon", buf);	// byte[]
		
		request.getRequestDispatcher("insertMember.jsp").forward(request, response);
	}

}
