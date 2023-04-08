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
 * Servlet implementation class ApproveRestaurant
 */
@WebServlet("/admin/approveRestaurant.do")
public class ApproveRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rst_id= request.getParameter("rst_id");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		int cnt =service.signupApproval(rst_id);
		
		request.setAttribute("res", cnt);
		
		request.getRequestDispatcher("/admin/view/result.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
