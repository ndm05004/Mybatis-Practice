package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberService;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/deletemember.do")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = (String)request.getParameter("id");
				
		IMemberService service = MemberService.getInstance();
		
		int cnt = service.deleteMember(id);
		
		if(cnt>0) {
			response.sendRedirect(request.getContextPath() + "/memberList.do");
		}
		
		
		
	}


}
