package tw.brad.servlet;

import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/Brad09")
@MultipartConfig( location = "C:\\Users\\User\\git\\repository\\BradWeb\\src\\main\\webapp\\upload")
public class Brad09 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String account = request.getParameter("account");
		System.out.println(account);
		System.out.println("----");
		
		int i = 0;
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			if (part.getName().equals("upload")) {
				i++;
				String filename = 
					String.format("%s_%d_%s", account, i, part.getSubmittedFileName());
				if (part.getSize() > 0) {
					part.write(filename);
				}
			}
		}
		
	
	
	}

}
