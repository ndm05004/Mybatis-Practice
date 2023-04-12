package rrs.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.MemberVO;

@WebServlet("/idSearch.do")
public class IdSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String memName = request.getParameter("name");
		String memMail = request.getParameter("email");
		
		MemberVO vo = new MemberVO();
		vo.setMem_name(memName);
		vo.setMem_mail(memMail);
		
		
		IMemberService service = MemberServiceImpl.getInstance();
		String id = service.searchId(vo);
		
		request.setAttribute("memid", id);
		request.getRequestDispatcher("/member/view/idSearch.jsp").forward(request, response);
		
	}

}
