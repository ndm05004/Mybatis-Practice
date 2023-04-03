package kr.or.ddit.basic.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sessionLogin.do")
public class SessionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
	
		HttpSession session = request.getSession();
		
		String userID = request.getParameter("userid");
		String userPass = request.getParameter("userpass");
		String flag = "true";
		
		session.setAttribute("USERID", userID);
		session.setAttribute("USERPASS", userPass);
		
		if("test".equals(userID) && "1234".equals(userPass)) {
			session.setAttribute("FLAG", flag);
			response.sendRedirect(request.getContextPath() + "/basic/session/sessionLogin.jsp");
		}else {
			flag = "false";
			session.setAttribute("FLAG", flag);
			response.sendRedirect(request.getContextPath() + "/basic/session/sessionLogin.jsp");
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}