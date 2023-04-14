package rrs.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.ReviewVO;

@WebServlet("/reviewUpdate.do")
public class ReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String rr = request.getParameter("renum");
//		System.out.println(rr);
		
		int renum = Integer.parseInt(rr);
		String cont = request.getParameter("cont");
		
		ReviewVO vo = new ReviewVO();
		vo.setRv_id(renum);
		vo.setRv_content(cont);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.updateReview(vo);
		
		request.setAttribute("result", cnt);
		request.getRequestDispatcher("/member/view/result.jsp").forward(request, response);
	}

}
