package rrs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.NoticeBoardVO;

/**
 * Servlet implementation class NoticeboardUpdate
 */
@WebServlet("/admin/noticeboardUpdate.do")
public class NoticeboardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		int nbid = Integer.parseInt(request.getParameter("num"));
		
		
		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setNb_title(request.getParameter("title"));
		vo.setNb_content(request.getParameter("content"));
	    vo.setNb_id(Integer.parseInt(request.getParameter("num")));
		System.out.println(vo.getNb_title());
		System.out.println(vo.getNb_content());
		System.out.println(vo.getNb_id());
	    IAdminService service = AdminServiceImpl.getInstance();
	
		
		int res = service.noticeboardUpdate(vo);
	
		Gson gson = new Gson();
		
		String result = gson.toJson(vo);
		
		response.getWriter().write(result); 
		response.flushBuffer();

	}

}
