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
import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.ReviewVO;
import rrs.vo.RstcmtVO;

/**
 * Servlet implementation class ReviewAll
 */
@WebServlet("/member/review.do")
public class ReviewAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("rst_id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		IRstService service2 = RstServiceImpl.getInstance();
		
		List<ReviewVO> list = service.rstreview(id);

		
		for(int i=0; i<list.size(); i++) {
			List<RstcmtVO> rstlist = service2.showReply(list.get(i).getRv_id());
			list.get(i).setRstcmtlist(rstlist);
		}
		
		
		request.setAttribute("review", list);
		
		request.getRequestDispatcher("/member/view/reviewAll.jsp").forward(request, response);
		
	}

}
