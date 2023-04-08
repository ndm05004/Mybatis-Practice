package rrs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.RstDetailVO;

/**
 * Servlet implementation class RestaurantDetail
 */
@WebServlet("/admin/restaurantDetail.do")
public class RestaurantDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String rst_id = request.getParameter("rst_id");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		RstDetailVO vo= service.restaurantDetail(rst_id);
		
		/*
		 * Gson gson = new Gson();
		 * 
		 * String jsonData = gson.toJson(vo);
		 * 
		 * response.getWriter().write(jsonData); response.flushBuffer();
		 */
		 
		
		request.setAttribute("rstDetailVo", vo);
		request.getRequestDispatcher("/admin/view/restaurantDetailview.jsp").forward(request, response);
		
	}

}
