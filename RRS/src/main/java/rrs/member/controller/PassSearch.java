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

@WebServlet("/passSearch.do")
public class PassSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id"); 
		String name = request.getParameter("name"); 
		String email = request.getParameter("email");
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_mail(email);
		
		// 서비스 메서드 계정 있는지 확인
		IMemberService service = MemberServiceImpl.getInstance();
		
		String pass = service.searchPass(vo);
		request.setAttribute("pass", pass);
		request.getRequestDispatcher("/member/view/passSearch.jsp").forward(request, response);
	}

}
