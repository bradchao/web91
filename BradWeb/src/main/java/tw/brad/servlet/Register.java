package tw.brad.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.brad.apis.MemberDB;

import java.io.IOException;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private MemberDB memberDB;
	
	public Register() {
		try {
			memberDB = new MemberDB();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String account = request.getParameter("account");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		if (!memberDB.isAccountExist(account)) {
			try {
				if (memberDB.addMember(account, passwd, name)) {
					response.sendRedirect("brad25.jsp");
				}else {
					response.sendRedirect("brad24.jsp?errType=2");
				}
			}catch(Exception e) {
				System.out.println(e);
			}
		}else {
			response.sendRedirect("brad24.jsp?errType=1");
		}
	
	}

}
