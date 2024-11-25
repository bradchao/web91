package tw.brad.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet("/Brad08")
@MultipartConfig( location = "C:\\Users\\User\\git\\repository\\BradWeb\\src\\main\\webapp\\upload")
public class Brad08 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String urip = request.getRemoteAddr();
		
		Part part = request.getPart("upload");
		System.out.println(part.getContentType());
		System.out.println(part.getName());
		System.out.println(part.getSize());
		System.out.println(part.getSubmittedFileName());
		
		String filename = String.format("%s_%s", urip, part.getSubmittedFileName());
		
		if (part.getSize() > 0) {
			part.write(filename);
			System.out.println("Upload Success");
		}else {
			System.out.println("Upload Failure");
		}
	
	
	}

}
