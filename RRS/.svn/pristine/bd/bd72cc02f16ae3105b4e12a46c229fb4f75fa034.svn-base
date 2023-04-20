package rrs.rstaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.MenuVO;

/**
 * Servlet implementation class DeleteMenu
 */
@WebServlet("/deleteMenu.do")
public class DeleteMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int menuId = Integer.parseInt(request.getParameter("mid"));
		String rstId = request.getParameter("rid");
		
		MenuVO vo = new MenuVO();
		vo.setRst_id(rstId);
		vo.setMenu_id(menuId);
		
		IRstService service = RstServiceImpl.getInstance();
		
		int res = service.deleteMenu(vo);
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
	}

}
