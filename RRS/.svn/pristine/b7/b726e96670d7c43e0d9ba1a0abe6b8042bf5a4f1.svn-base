package rrs.rstaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.MemberVO;
import rrs.vo.RvrepotVO;

@WebServlet("/reviewReport.do")
public class ReviewReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reportRss = request.getParameter("rss");
		String reportRs = request.getParameter("rs");
		int rvid = Integer.parseInt(request.getParameter("rvid"));
		String rstid = request.getParameter("id");
		
		RvrepotVO vo = new RvrepotVO();
		vo.setRvr_reason(reportRss+" "+reportRs);
		vo.setMem_id(rstid);
		vo.setRv_id(rvid);
		
		IRstService service = RstServiceImpl.getInstance();
		MemberVO mvo = new MemberVO();
		
		mvo = service.idfromrv(rvid);
		String memid = mvo.getMem_id(); 
		
		int result = service.rstReport(memid, vo);
		request.setAttribute("res", result);
		
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
		
	}

}
