package rrs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;

@WebServlet("/admin/deleteBlackList.do")
public class DeleteBlackList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("mem_id");
		IAdminService service = AdminServiceImpl.getInstance();
		
		int cnt = service.signupBlackListDel(mem_id);
		
		
		request.setAttribute("res", cnt);
		
		request.getRequestDispatcher("/admin/view/result.jsp").forward(request, response);

	
	}

}
