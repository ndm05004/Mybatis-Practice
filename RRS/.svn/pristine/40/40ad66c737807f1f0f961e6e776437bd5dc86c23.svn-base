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
import rrs.vo.NoticeBoardVO;
import rrs.vo.PageVO;


/**
 * Servlet implementation class NoticeBoardInfo
 */
@WebServlet("/admin/noticeBoardInfo.do")
public class NoticeBoardInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		
	/*	int page;
		try {
		    page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
		    page = 1; // 기본값으로 1을 사용하거나, 적절한 기본값을 설정할 수 있음
		}
	*/	
		IAdminService service = AdminServiceImpl.getInstance();
		
		Map<String, Object> params = new HashMap<>();
		params.put("table", "noticeboard");
		
		PageVO pvo = service.pageInfo(page, params);
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		List<NoticeBoardVO> noticeVo = service.noticeBoardInfo(map);
		
		request.setAttribute("noticeVo", noticeVo);
		request.setAttribute("startPage", pvo.getStartPage());
		request.setAttribute("endPage", pvo.getEndPage());
		request.setAttribute("totalPage", pvo.getTotalPage());		
		
		request.getRequestDispatcher("/admin/view/noticeBoardInfoview.jsp").forward(request, response);
	}



}
