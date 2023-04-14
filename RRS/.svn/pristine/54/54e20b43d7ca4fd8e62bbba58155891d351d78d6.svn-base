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
import rrs.vo.MenuVO;

/**
 * Servlet implementation class MenuShow
 */
@WebServlet("/menuShow.do")
public class MenuShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String rstId = request.getParameter("id");
		IRstService service = RstServiceImpl.getInstance();

		List<MenuVO> list = service.showMenu(rstId);

		request.setAttribute("menulist", list);

		request.getRequestDispatcher("/restaurant/view/menulist.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int menuId = Integer.parseInt(request.getParameter("mid"));
		String rstId = request.getParameter("rid");
		MenuVO vo = new MenuVO();
		
		vo.setMenu_id(menuId);
		vo.setRst_id(rstId);
		
		IRstService service = RstServiceImpl.getInstance();
		
		MenuVO menuDetail = service.getMenuDetail(vo);
		
		request.setAttribute("menuDetail", menuDetail);
		
		request.getRequestDispatcher("/restaurant/view/menuDetail.jsp").forward(request, response);
	}

}
