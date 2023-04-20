package rrs.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.BookmarkVO;

@WebServlet("/Deletebook.do")
public class Deletebook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
				
		String rstId = request.getParameter("rstid");
		String memId = request.getParameter("memid");
		
		BookmarkVO bkVo = new BookmarkVO();
		bkVo.setMem_id(memId);
		bkVo.setRst_id(rstId);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int res = service.bookMarkDelete(bkVo);
		
		Gson gson = new Gson();
		String result = null;
		
		result = gson.toJson(res);
		
		response.getWriter().write(result);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
