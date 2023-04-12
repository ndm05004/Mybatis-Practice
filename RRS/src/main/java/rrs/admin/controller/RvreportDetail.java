package rrs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.RvReportViewVO;

/**
 * Servlet implementation class RvreportDetail
 */
@WebServlet("/admin/rvreportDetail.do")
public class RvreportDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mem_id = (String)request.getParameter("mem_id");
				
		IAdminService service = AdminServiceImpl.getInstance();
		
		List<RvReportViewVO> vo = service.rvreportDetail(mem_id);
		
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(vo);		 
		response.getWriter().write(jsonData); response.flushBuffer();
		
	}

}