package rrs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.MemberVO;

/**
 * Servlet implementation class MemberDetail
 */
@WebServlet("/admin/memberDetail.do")
public class MemberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("mem_id");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		MemberVO vo= service.memberDetail(mem_id);
		
		request.setAttribute("memDetailVo", vo);
		request.getRequestDispatcher("/admin/view/memberDetailview.jsp").forward(request, response);
	}

}
