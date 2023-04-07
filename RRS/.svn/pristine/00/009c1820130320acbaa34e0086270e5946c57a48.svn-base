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
import rrs.vo.MemberVO;
import rrs.vo.RstDetailVO;

/**
 * Servlet implementation class MemberInfo
 */
@WebServlet("/admin/memberInfo.do")
public class MemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		IAdminService service = AdminServiceImpl.getInstance();
		
	    List<MemberVO> memberlist = service.memberInfo();
	    
		request.setAttribute("memDetailList", memberlist);
		
		request.getRequestDispatcher("/admin/view/memberInfo.jsp").forward(request, response);;
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}

}
