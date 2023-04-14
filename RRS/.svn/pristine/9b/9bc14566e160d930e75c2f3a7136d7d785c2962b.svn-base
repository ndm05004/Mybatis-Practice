package rrs.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.MemberVO;

@WebServlet("/memDelete.do")
public class MemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String delId = request.getParameter("id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.deleteMember(delId);
		
		if(cnt > 0) {
			HttpSession session = request.getSession();
//			MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
			session.invalidate();
		}
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/member/view/memDelResult.jsp").forward(request, response);
	}

}
