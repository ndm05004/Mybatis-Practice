package rrs.rstaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.RstcmtVO;

@WebServlet("/reviewCom.do")
public class ReviewCom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String rvcmt = request.getParameter("rvcmt");	// 댓글 내용
		String id = request.getParameter("id");	// 사장아이디
		int rvid = Integer.parseInt( request.getParameter("rvid")); // 리뷰 아이디
		System.out.println("도착했니?");
		RstcmtVO vo = new RstcmtVO();
		
		vo.setRv_id(rvid);
		vo.setRcmt_content(rvcmt);
		vo.setRst_id(id);
		
		IRstService service = RstServiceImpl.getInstance();
		
		int res = service.insertRstCmt(vo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
	
	}
	

}
