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
 * Servlet implementation class NoticeBoardWrite
 */
@WebServlet("/admin/noticeBoardWrite.do")
public class NoticeBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String title = (String)request.getParameter("title");
		String comment = (String)request.getParameter("comment");
		
		NoticeBoardVO nvo = new NoticeBoardVO();
		
		nvo.setNb_content(comment);
		nvo.setNb_title(title);
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		int cnt = service.noticeBoardWrite(nvo);
		
		response.sendRedirect(request.getContextPath()+"/admin/index.jsp");

		
	}


}
