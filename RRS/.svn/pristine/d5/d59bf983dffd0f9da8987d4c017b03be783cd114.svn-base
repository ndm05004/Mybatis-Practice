package rrs.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;

/**
 * Servlet implementation class RstTotalCount
 */
@WebServlet("/admin/rstTotalCount.do")
public class RstTotalCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		Map<String, Object> params = new HashMap<>();
		params.put("table", "restaurant");
		params.put("acceptNotNull", "acceptnotnull");
		
		int res = service.totalCount(params);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(res);
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
	}
}

