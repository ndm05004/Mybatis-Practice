package rrs.member.controller;

import java.io.IOException;
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
import rrs.vo.RvrepotVO;


@WebServlet("/member/memberStUpdate.do")
public class memberStUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String depender = request.getParameter("depender");
				
		String reporter = request.getParameter("reporter");
		String reportRss = request.getParameter("rss");
		String reportRs = request.getParameter("rs");
		int rvid = Integer.parseInt(request.getParameter("rvid"));
		String rstid = request.getParameter("id");
		
		RvrepotVO vo = new RvrepotVO();
		vo.setRvr_reason(reportRss+" "+reportRs);
		vo.setMem_id(rstid);
		vo.setRv_id(rvid);
		vo.setMem_id(reporter);
				
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.memberStUpdate(depender, vo);
		
		request.setAttribute("res", cnt);
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
	}

}

