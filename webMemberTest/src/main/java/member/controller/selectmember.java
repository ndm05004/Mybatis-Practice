package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberService;
import member.vo.MemberVo;

/**
 * Servlet implementation class selectmember
 */
@WebServlet("/selectMember.do")
public class selectmember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = (String)request.getParameter("id");
				
		IMemberService service = MemberService.getInstance();
		
		MemberVo vo = service.selectDetail(id);
		
		System.out.println(vo);
		
		request.setAttribute("res", vo);
		request.getRequestDispatcher("/MemberDetail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
