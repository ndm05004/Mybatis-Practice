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
 * Servlet implementation class DeleteRestaurant
 */
@WebServlet("/admin/deleteRestaurant.do")
public class DeleteRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rst_id= request.getParameter("rst_id");
				
		IAdminService service = AdminServiceImpl.getInstance();
		
		int cnt =service.signupDelete(rst_id);
		

		request.setAttribute("res", cnt);
		
		request.getRequestDispatcher("/admin/view/result.jsp").forward(request, response);
		
		
	}

}
