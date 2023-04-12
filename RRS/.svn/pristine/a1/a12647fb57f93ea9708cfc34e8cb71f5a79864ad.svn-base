package rrs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.admin.dao.AdminDaoImpl;
import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.MemberVO;

/**
 * Servlet implementation class BlackListInfo
 */
@WebServlet("/admin/blackListInfo.do")
public class BlackListInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
	
		List<MemberVO> blackList = service.blackListInfo();
		
		request.setAttribute("blackList", blackList);
		
		request.getRequestDispatcher("/admin/view/blackListInfo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
