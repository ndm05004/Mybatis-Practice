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
import rrs.vo.PageVO;
import rrs.vo.RestautantVO;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/admin/awaitAproval.do")
public class AwaitAproval extends HttpServlet {
	private static final long serialVersionUID = 1L;
          

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//요청시 전송데이터 가져오기
		int page = Integer.parseInt(request.getParameter("page")); // 최초 실행시 1
		
		// service객체 얻기
		IAdminService service = AdminServiceImpl.getInstance();
		
		// service메소드 호출하기 - 페이지 처리에 필요한 값들을 계산 
		Map<String, Object> params = new HashMap<>();
		params.put("table", "restaurant");
		params.put("acceptNull", "acceptnull");
		PageVO pvo = service.pageInfo(page, params);
		
		// service메소드 - list를 select 결과값 받기
		Map<String, Object> map = new HashMap<>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		
		List<RestautantVO> list = service.waitApproval(map);
		
		// 결과값을 request에 저장
		request.setAttribute("listValue", list);
		request.setAttribute("startPage", pvo.getStartPage());
		request.setAttribute("endPage", pvo.getEndPage());
		request.setAttribute("totalPage", pvo.getTotalPage());
		
		//view페이지로 이동
		request.getRequestDispatcher("/admin/view/awaitAprovalview.jsp").forward(request, response);

	}

}
