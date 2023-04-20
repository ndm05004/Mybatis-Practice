package rrs.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.ReviewVO;

@WebServlet("/memReplyList.do")
public class MemReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		
		
		String id = request.getParameter("id");
		int more = Integer.parseInt( request.getParameter("more"));
//		System.out.println("댓글 가져올 아이디: " + id);
//		System.out.println("more: " + more);
		
		
		ReviewVO vo = new ReviewVO();
		vo.setMem_id(id);
		vo.setMore(more);
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<ReviewVO> rvList = service.selectRvList(vo);
		
		request.setAttribute("review", rvList);
		
		// view 페이지 만들어서 댓글이 있는지 없는지 flag 확인
		request.getRequestDispatcher("/member/view/review.jsp").forward(request, response);
		
		
	}

}
