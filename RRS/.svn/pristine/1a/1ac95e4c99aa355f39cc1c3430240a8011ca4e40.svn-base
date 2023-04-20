package rrs.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.BookmarkVO;
import rrs.vo.MemberVO;
import rrs.vo.SearchVO;


@WebServlet("/SearchContent.do")
public class SearchContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		response.setContentType("application/json; charset=utf-8");
		
		String cont = request.getParameter("content");
		
		HttpSession session = request.getSession();
		MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<SearchVO> list = service.searchRst(cont);
		List<BookmarkVO> mList = service.bookMarkCheck(memVo.getMem_id());
		
		Map<String, Object> s = new HashMap<>();
		s.put("list", list);
		s.put("mList", mList);
		
		Gson gson = new Gson();
		String result = null;
		
		result = gson.toJson(s);
		
		response.getWriter().write(result);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
