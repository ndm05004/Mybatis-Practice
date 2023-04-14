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

@WebServlet("/modifyCmt.do")
public class ModifyCmt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String newcont = request.getParameter("new");
		
		IRstService service = RstServiceImpl.getInstance();
		
		RstcmtVO vo= new RstcmtVO();
		
		vo.setRcmt_content(newcont);
		vo.setRcmt_id(no);
		
		int res = service.modifyCmt(vo);
		
		request.setAttribute("res",res);
		
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
		
	
	}

}
