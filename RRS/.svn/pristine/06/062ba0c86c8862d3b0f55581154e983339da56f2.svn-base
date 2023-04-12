package rrs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.NoticeBoardVO;

/**
 * Servlet implementation class NoticeBoardDetail
 */
@WebServlet("/admin/noticeBoardDetail.do")
public class NoticeBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int nb_id = Integer.parseInt(request.getParameter("nb_id"));

		IAdminService service = AdminServiceImpl.getInstance();
		
		NoticeBoardVO nvo = service.noticeBoardDetail(nb_id);
				
		request.setAttribute("nvo", nvo);
		
		request.getRequestDispatcher("/admin/view/noticeBoardDetailView.jsp").forward(request, response);
	}



}
