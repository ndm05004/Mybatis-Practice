package rrs.rstaurant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.IqrVO;

@WebServlet("/rstQuestion.do")
public class RstQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String rstid = request.getParameter("id");
		System.out.println(rstid);
		
		IRstService service = RstServiceImpl.getInstance();
		
		List<IqrVO> list = service.rstQuestion(rstid);
		System.out.println(list.size());
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/restaurant/view/rstQuestion.jsp").forward(request, response);
	
	}

}
