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
 * Servlet implementation class NoticeboardDelete
 */
@WebServlet("/admin/noticeboardDelete.do")
public class NoticeboardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		int res = service.noticeboardDelete(board_id);

		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/admin/view/result.jsp").forward(request, response);
		
	}

}