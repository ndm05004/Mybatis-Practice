package rrs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;

/**
 * Servlet implementation class RvrRelease
 */
@WebServlet("/admin/rvrRelease.do")
public class RvrRelease extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int rvr_id = Integer.parseInt(request.getParameter("rvr_id"));
	String mem_id = request.getParameter("mem_id");
	
	IAdminService service = AdminServiceImpl.getInstance();
	
	int res = service.rvrRelease2(mem_id, rvr_id);
	
	request.setAttribute("res", res);
	
	request.getRequestDispatcher("/admin/view/result.jsp").forward(request, response);
	
	}

}
