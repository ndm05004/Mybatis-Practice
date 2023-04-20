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

@WebServlet("/iqrDelete.do")
public class iqrDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int id = Integer.parseInt(request.getParameter("iqr_id"));
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.iqrDelete(id);
		
		Gson gson = new Gson();
		String result = null;
		
		result = gson.toJson(cnt);
		
		response.getWriter().write(result);
		response.flushBuffer();
	}

}
