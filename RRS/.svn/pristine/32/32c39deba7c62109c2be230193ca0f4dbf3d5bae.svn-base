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

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.MemberVO;
import rrs.vo.PageVO;

/**
 * Servlet implementation class MemberInfo
 */
@WebServlet("/admin/memberInfo.do")
public class MemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		

		IAdminService service = AdminServiceImpl.getInstance();
		
		Map<String, Object> params = new HashMap<>();
		params.put("table", "members");
		
		PageVO pvo = service.pageInfo(page, params);
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		
	    List<MemberVO> memberlist = service.memberInfo(map);
	    
		request.setAttribute("memDetailList", memberlist);
		request.setAttribute("startPage", pvo.getStartPage());
		request.setAttribute("endPage", pvo.getEndPage());
		request.setAttribute("totalPage", pvo.getTotalPage());
		
		request.getRequestDispatcher("/admin/view/memberInfo.jsp").forward(request, response);
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}

}
