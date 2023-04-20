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
import rrs.vo.TagVO;

/**
 * Servlet implementation class GetTag
 */
@WebServlet("/getTag.do")
public class GetTag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String rstId = request.getParameter("id");
		
		IRstService service = RstServiceImpl.getInstance();
		
		List<TagVO> tagList = service.getTag();// 태그 전체
		
		List<TagVO> selectTag = service.selectTag(rstId);
		
		request.setAttribute("tagList", tagList);
		request.setAttribute("selectTag", selectTag);
		
		request.getRequestDispatcher("/restaurant/view/tagZip.jsp").forward(request, response);
		
	}


}
