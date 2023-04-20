package rrs.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.MemberVO;

@WebServlet("/memLogin.do")
public class MemLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		response.setContentType("text/html; charset=utf-8");

		String id = request.getParameter("uid");
		String pass = request.getParameter("upass");
		String chkid = request.getParameter("chkid");

		if ("admin".equals(id) && "admin".equals(pass)) {
			request.setAttribute("adminid", id);
			request.setAttribute("adminpass", pass);
			request.getRequestDispatcher("/member/view/admincheck.jsp").forward(request, response);
		} else {

			MemberVO vo = new MemberVO();
			vo.setMem_id(id);
			vo.setMem_pass(pass);

			IMemberService service = MemberServiceImpl.getInstance();

			// DB에서 id와 password가 일치하는 데이터 검색해서 가져오기
			MemberVO loginCheck = service.loginCheck(vo);

			HttpSession session = request.getSession();

			if (loginCheck != null) { // 로그인 성공!!

				if (loginCheck.getMem_st() == 1) {
					request.setAttribute("memcheck", "blackList");
					request.getRequestDispatcher("/member/view/blackListcheck.jsp").forward(request, response);
				} else {

					session.setAttribute("loginMember", loginCheck);

					// 쿠키 객체 생성(쿠키이름: 'USERID', 쿠키값: 로그인한 ID)
					Cookie loginCookie = new Cookie("USERID", id);

					// checkbox가 체크된 상태이면 쿠키 저장, 해제된 상태이면 쿠키 삭제
					if (chkid.equals("")) { // checkbox 해제 여부 검사
						loginCookie.setMaxAge(0);
					}
					response.addCookie(loginCookie);
					request.setAttribute("memcheck", loginCheck);
					request.getRequestDispatcher("/member/view/memcheck.jsp").forward(request, response);
				}
				// response.sendRedirect(request.getContextPath()+"/mainPage.jsp");

			}
		}
	}

}
