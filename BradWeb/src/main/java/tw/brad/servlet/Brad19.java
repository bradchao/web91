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

@WebServlet("/Brad19")
public class Brad19 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String source = "C:\\Users\\User\\git\\repository\\BradWeb\\src\\main\\webapp\\views\\view1.html";
		File html = new File(source);
		byte[] buf = new byte[(int)html.length()];
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(html));
		bin.read(buf);
		
		String content = new String(buf);
		
		PrintWriter out = response.getWriter();
		out.print(content);
	}

}
