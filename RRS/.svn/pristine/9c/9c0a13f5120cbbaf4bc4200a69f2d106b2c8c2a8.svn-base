package rrs.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.MenuVO;

/**
 * Servlet implementation class MenuShow
 */
@WebServlet("/member/menu.do")
public class MenuShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String rstId = request.getParameter("rst_id");
		IRstService service = RstServiceImpl.getInstance();

		List<MenuVO> list = service.showMenu(rstId);
		
		
		request.setAttribute("menulist", list);

		request.getRequestDispatcher("/member/view/showMenu.jsp").forward(request, response);

	}

}
