package rrs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.BookmarkVO;

/**
 * Servlet implementation class DidIDoMyFavorites
 */
@WebServlet("/member/didIDoMyFavorites.do")
public class DidIDoMyFavorites extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String rstid = request.getParameter("rstid");
		String memid = request.getParameter("memid");
		
		System.out.println(rstid);
		System.out.println(memid);
		
		BookmarkVO vo = new BookmarkVO();
		vo.setMem_id(memid);
		vo.setRst_id(rstid);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int res = service.didIDoMyFavorites(vo);
		System.out.println(res);
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
	}

}
