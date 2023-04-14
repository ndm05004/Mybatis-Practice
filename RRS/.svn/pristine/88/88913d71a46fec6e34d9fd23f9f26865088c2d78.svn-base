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

import rrs.admin.dao.AdminDaoImpl;
import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;
import rrs.vo.MemberVO;
import rrs.vo.PageVO;
import rrs.vo.RstDetailVO;

/**
 * Servlet implementation class BlackListInfo
 */
@WebServlet("/admin/blackListInfo.do")
public class BlackListInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int page = Integer.parseInt(request.getParameter("page"));

		IAdminService service = AdminServiceImpl.getInstance();
		
		Map<String, Object> params = new HashMap<>();
		params.put("table", "members");
		params.put("memSt", "memSt");
		
		PageVO pvo = service.pageInfo(page, params);
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		List<MemberVO> blackList = service.blackListInfo(map);
		
		request.setAttribute("blackList", blackList);
		request.setAttribute("startPage", pvo.getStartPage());
		request.setAttribute("endPage", pvo.getEndPage());
		request.setAttribute("totalPage", pvo.getTotalPage());
			
		request.getRequestDispatcher("/admin/view/blackListInfo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
