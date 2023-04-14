package rrs.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.SearchVO;


@WebServlet("/SearchContent.do")
public class SearchContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String cont = request.getParameter("content");
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<SearchVO> list = service.searchRst(cont);
		
		Gson gson = new Gson();
		String result = null;
		
		result = gson.toJson(list);
		
		response.getWriter().write(result);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
