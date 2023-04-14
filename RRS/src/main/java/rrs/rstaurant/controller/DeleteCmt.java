package rrs.rstaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;

@WebServlet("/deleteCmt.do")
public class DeleteCmt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int rstcmtNo = Integer.parseInt(request.getParameter("no"));
		
		IRstService service = RstServiceImpl.getInstance();
		
		int res = service.deleteCmt(rstcmtNo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
	}

}
