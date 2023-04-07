package rrs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.RestautantVO;
import rrs.vo.RstDetailVO;

/**
 * Servlet implementation class RestaurantInfo
 */
@WebServlet("/admin/restaurantInfo.do")
public class RestaurantInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		List<RstDetailVO> rstDetailList = service.restaurantInfo();
		request.setAttribute("rstDetailList", rstDetailList);
		request.getRequestDispatcher("/admin/view/rstDetailview.jsp").forward(request, response);;
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
