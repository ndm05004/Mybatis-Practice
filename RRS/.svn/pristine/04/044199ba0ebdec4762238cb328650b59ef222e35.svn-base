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

@WebServlet("/iqrBoardUpdate.do")
public class iqrBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int iqrId = Integer.parseInt(request.getParameter("iqrid"));
		String iqrSubject = request.getParameter("subject");
		String iqrContent = request.getParameter("content");
		String iqrWriter = request.getParameter("writer");
		String iqrRstname = request.getParameter("rstname");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		IqrVO iqrVo = new IqrVO();
		iqrVo.setIqr_id(iqrId);
		iqrVo.setIqr_title(iqrSubject);
		iqrVo.setIqr_content(iqrContent);
		iqrVo.setMem_id(iqrWriter);
		iqrVo.setRst_id(iqrRstname);;
		
		int cnt = service.iqrUpdate(iqrVo);
		
		Gson gson = new Gson();
		String result = null;
		
		result = gson.toJson(cnt);
		
		response.getWriter().write(result);
		response.flushBuffer();
	}

}
