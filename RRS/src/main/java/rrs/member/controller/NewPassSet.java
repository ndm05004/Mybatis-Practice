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

@WebServlet("/newPassSet.do")
public class NewPassSet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("memid");
		String newPass = request.getParameter("newPass");
		
//		System.out.println("서블릿에서 호출한 아이디: " + memId);
//		System.out.println("서블릿에서 호출한 비밀번호: " + newPass);
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(memId);
		vo.setMem_pass(newPass);
		
		IMemberService service = MemberServiceImpl.getInstance();
		// 메서드 호출
		int cnt = service.newPassSet(vo);
		
		request.setAttribute("result", cnt);
		request.getRequestDispatcher("/member/view/passSetResult.jsp").forward(request, response);
	}

}
