package rrs.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kotlin.reflect.jvm.internal.impl.resolve.scopes.MemberScopeImpl;
import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;

@WebServlet("/MemberIdCheck.do")
public class MemberIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberIdCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String memId = request.getParameter("uid");
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.memberIdCheck(memId);
		
		Gson gson = new Gson();
		String result = null;
		
		if(cnt>0) {
			result = gson.toJson("Fail");
		}else {
			result = gson.toJson("OK");
		}
		
		response.getWriter().write(result);
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
