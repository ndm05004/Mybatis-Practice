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

@WebServlet("/modifyMem.do")
public class ModifyMem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	    
	    String id = request.getParameter("memid");
	    String pass = request.getParameter("mempass");
	    String name = request.getParameter("memname");
	    String nick = request.getParameter("memnick");
	    String bir = request.getParameter("membir");
	    String tel = request.getParameter("memtel");
	    String email = request.getParameter("memmail");
	    
	    MemberVO vo = new MemberVO();
	    vo.setMem_id(id);
	    vo.setMem_pass(pass);
	    vo.setMem_name(name);
	    vo.setMem_nick(nick);
	    vo.setMem_bir(bir);
	    vo.setMem_tel(tel);
	    vo.setMem_mail(email);
	    
	    IMemberService service = MemberServiceImpl.getInstance();
	    int cnt = service.updateMember(vo);
	    
	    MemberVO memVO = service.loginCheck(vo);
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("loginMember", memVO);
	    
	    response.sendRedirect(request.getContextPath()+"/member/memMyPage.jsp");
	    
	}

}
