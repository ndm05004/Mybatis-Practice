package rrs.rstaurant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.RstcmtVO;

@WebServlet("/showReply.do")
public class ShowReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int rvid = Integer.parseInt(request.getParameter("rvid"));
	
		IRstService service = RstServiceImpl.getInstance();
		
		List<RstcmtVO> list = service.showReply(rvid);
		
		request.setAttribute("list",list);
		
		request.getRequestDispatcher("/restaurant/view/showReply.jsp").forward(request, response);
	
	
	}

}
