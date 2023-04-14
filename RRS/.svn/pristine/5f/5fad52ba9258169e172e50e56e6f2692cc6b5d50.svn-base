package rrs.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.ReservationDetailVO;
import rrs.vo.ReservationVO;
import rrs.vo.RsMenuVO;

@WebServlet("/memRsvList.do")
public class MemRsvList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<ReservationDetailVO> rsvList = service.selectRsvList(id);
		
		for(ReservationDetailVO resVo : rsvList) {
			List<RsMenuVO> menuList = service.selectRsMenuList(resVo.getRs_id()); 
			resVo.setMenu_list(menuList);
		}
		
		request.setAttribute("rsvList", rsvList);
		
		request.getRequestDispatcher("/member/view/rsvList.jsp").forward(request, response);
	}
}
