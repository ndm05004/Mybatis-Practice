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
import rrs.vo.RestautantVO;

@WebServlet("/bookmarkList.do")
public class BookmarkList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<RestautantVO> bookmarkList = service.selectBookmark(id);
		
		request.setAttribute("bList", bookmarkList);
		request.getRequestDispatcher("/member/view/bookmarkResult.jsp").forward(request, response);
	}

}
