package rrs.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.CmtReportViewVO;
import rrs.vo.RvReportViewVO;

/**
 * Servlet implementation class ReportListView
 */
@WebServlet("/admin/reportListView.do")
public class ReportListView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		Map<String, Object> result = service.reportList();

		Gson gson = new Gson();
		
		String jsonData = gson.toJson(result);
		
		response.getWriter().write(jsonData); 
		response.flushBuffer();
		
	}
}
