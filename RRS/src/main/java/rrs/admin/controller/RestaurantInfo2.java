package rrs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.RestautantVO;
import rrs.vo.RstDetailVO;

/**
 * Servlet implementation class RestaurantInfo2
 */
@WebServlet("/admin/restaurantInfo2.do")
public class RestaurantInfo2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		List<RstDetailVO> rstList = service.restaurantInfo2();

		request.setAttribute("rstList", rstList);
		request.getRequestDispatcher("/admin/view/adminMainrstList.jsp").forward(request, response);

	}

}
