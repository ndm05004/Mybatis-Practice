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
import rrs.vo.IqrVO;

@WebServlet("/IqrList.do")
public class IqrList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<IqrVO> iqrList = service.selectIqrList(id);
		
		Gson gson = new Gson();
		String result = null;
		
		result = gson.toJson(iqrList);
		
		response.getWriter().write(result);
		response.flushBuffer();
	}

}
