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

@WebServlet("/MemberInsert.do")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/member/view/memberJoin3.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("uid");
		String memPass = request.getParameter("pw");
		String memName = request.getParameter("uname");
		String memMail = request.getParameter("umail");
		String memTel = request.getParameter("utel");
		String memNick = request.getParameter("unick");
		String memBir = request.getParameter("ubir");
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(memId);
		memVo.setMem_pass(memPass);
		memVo.setMem_name(memName);
		memVo.setMem_bir(memBir);
		memVo.setMem_nick(memNick);
		memVo.setMem_tel(memTel);
		memVo.setMem_mail(memMail);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int res = service.insertMember(memVo);
		
		response.sendRedirect(request.getContextPath()+"/restaurant/joinSuccess.jsp?res="+res);
	
	}

}
