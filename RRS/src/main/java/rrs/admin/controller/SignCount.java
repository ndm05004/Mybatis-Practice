package rrs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rrs.admin.service.AdminServiceImpl;
import rrs.admin.service.IAdminService;


@WebServlet("/admin/signCount.do")
public class SignCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
				
		IAdminService service = AdminServiceImpl.getInstance();
		
		int res = service.signCount();
		
		Gson gson = new Gson();
		  
		String jsonData = gson.toJson(res);
		 
		response.getWriter().write(jsonData); 
		response.flushBuffer();

		
	}

}
