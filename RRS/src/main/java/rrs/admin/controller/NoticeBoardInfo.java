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
import rrs.vo.NoticeBoardVO;


/**
 * Servlet implementation class NoticeBoardInfo
 */
@WebServlet("/admin/noticeBoardInfo.do")
public class NoticeBoardInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		List<NoticeBoardVO> noticeVo = service.noticeBoardInfo();
		request.setAttribute("noticeVo", noticeVo);
		request.getRequestDispatcher("/admin/view/noticeBoardInfoview.jsp").forward(request, response);
	}



}
