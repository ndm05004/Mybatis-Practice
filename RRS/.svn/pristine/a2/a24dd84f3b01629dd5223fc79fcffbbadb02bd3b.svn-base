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
import rrs.vo.RestautantVO;
import rrs.vo.RsttagVO;
import rrs.vo.TagVO;

@WebServlet("/selectRst.do")
public class SelectRst extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		IRstService service = RstServiceImpl.getInstance();
		
		RestautantVO vo = service.selectRst(id);
		List<TagVO> list = service.selectTag(id);
		List<TagVO> taglist =service.getTag();
		
		
		request.setAttribute("rstvo", vo);
		request.setAttribute("rsttag", list);
		request.setAttribute("taglist", taglist);
		
		request.getRequestDispatcher("/restaurant/selectRst.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
