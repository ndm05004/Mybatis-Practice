package rrs.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;

@WebServlet("/memReviewDelete.do")
public class MemReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("renum"));
		IMemberService service = MemberServiceImpl.getInstance();
		
		int cnt = service.deleteReview(num);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/member/view/result.jsp").forward(request, response);
	}

}
