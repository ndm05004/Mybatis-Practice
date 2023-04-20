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
import rrs.vo.IqrVO;

@WebServlet("/iqrBoardInsert.do")
public class iqrBoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String iqrWriter = request.getParameter("writer");
		String iqrSubject = request.getParameter("subject");
		String iqrContent = request.getParameter("content");
		String iqrRstName = request.getParameter("rstname");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		/*String srtId = service.searchRstId(rstName);
		
		
		//requet에 저장 
		request.setAttribute("id", srtId);
		
		//forward- jsp  - succwss = srtId를 비교
		request.getRequestDispatcher("request.getContextPath()/member/view/IqrBoard.jsp")
		.forward(request, response);*/
		
	
				
		IqrVO iqrVo = new IqrVO();
		iqrVo.setMem_id(iqrWriter);
		iqrVo.setIqr_title(iqrSubject);
		iqrVo.setIqr_content(iqrContent);
		iqrVo.setRst_id(iqrRstName);
		
		int cnt = service.boardInsert(iqrVo);
		
		Gson gson = new Gson();
		String result = null;	
		
		result = gson.toJson(cnt);
		
		response.getWriter().write(result);
		response.flushBuffer();
			
		
		
	}

}
