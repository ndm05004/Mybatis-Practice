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
import rrs.vo.CmtReportVO;
import rrs.vo.RvReportViewVO;
import rrs.vo.RvrepotVO;

/**
 * Servlet implementation class RvreportList
 */
@WebServlet("/admin/rvreportList.do")
public class RvreportList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		List<RvReportViewVO> volist = service.rvreportList();
		
		request.setAttribute("volist", volist);
		request.getRequestDispatcher("/admin/view/rvreportListview.jsp").forward(request, response);

	}

}
