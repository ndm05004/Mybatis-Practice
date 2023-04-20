package rrs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.RestautantVO;

@WebServlet("/rstLogin.do")
public class RstLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("rid");
		String pass = request.getParameter("rpass");
		String chkid = request.getParameter("rchkid");
		
		RestautantVO vo = new RestautantVO();
		vo.setRst_id(id);
		vo.setRst_pass(pass);
		
		IRstService service = RstServiceImpl.getInstance();
		
		// DB에서 id와 password가 일치하는 데이터 검색해서 가져오기
		RestautantVO loginCheck = service.rstLogin(vo);
		
		HttpSession session = request.getSession();
		
		if(loginCheck != null) { // 로그인 성공!!
			session.setAttribute("loginRst", loginCheck);
			
			// 쿠키 객체 생성(쿠키이름: 'RSTID', 쿠키값: 로그인한 ID)
			Cookie loginCookie = new Cookie("RSTID", id);
					
			// checkbox가 체크된 상태이면 쿠키 저장, 해제된 상태이면 쿠키 삭제
			if(chkid.equals("")) { // checkbox 해제 여부 검사
				loginCookie.setMaxAge(0);
			}
			response.addCookie(loginCookie);
		}
		
		request.setAttribute("rstcheck", loginCheck);
		request.getRequestDispatcher("/restaurant/view/rstLoginCheck.jsp").forward(request, response);
	}

}
