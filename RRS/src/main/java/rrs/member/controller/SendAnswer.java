package rrs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.AnswerVO;
import rrs.vo.MemberVO;

/**
 * Servlet implementation class SendAnswer
 */
@WebServlet("/sendAnswer.do")
public class SendAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String wid = request.getParameter("wid"); // 문의작성자 닉네임
		String qcontent = request.getParameter("qcontent"); // 문의내용
		String resid = request.getParameter("rstid"); // 식당아이디
		int qno = Integer.parseInt(request.getParameter("qno")); // 문의 번호
		String acontent = request.getParameter("acontent"); // 답변내용
		System.out.println(wid);
		System.out.println(qcontent);
		System.out.println(resid);
		System.out.println(qno);
		System.out.println(acontent);

		IRstService service = RstServiceImpl.getInstance();
		AnswerVO vo = new AnswerVO();
		MemberVO mem = service.searchNick(wid);

		System.out.println("메일" + mem.getMem_mail());
		System.out.println("아이디:" + mem.getMem_id());

		vo.setA_content(acontent);
		vo.setQ_content(qcontent);
		vo.setIqr_id(qno);
		vo.setIqr_writer(mem.getMem_id());
		vo.setRst_id(resid);

		int res = service.insertAnswer(vo);

		String context = "[TableMate]" + wid + "님의 문의내역에 대한 답변입니다.";

		String context1 = "질문내용 :" + qcontent;
		String context2 = "답변내용 : " + acontent;
		String context4 = "<html><body><p><h2 style=\"color: #ff3d00;\"><strong>Table Mate</strong></h2></p>\r\n"
				+ "<p>안녕하세요," + wid + "님</p>\r\n" + "<p>보내주신 문의에 대한 답변 전달드립니다.</p>\r\n"
				+ "<div style='background: lightgray;border-radius:15px;padding :10px; width : auto;'><p style='font-weight:bold'><문의주신내용></p>\r\n"
				+ "<p>" + qcontent + "</p>\r\n" + "<p style='font-weight:bold'><답변 내용></p>\r\n" + "<p>" + acontent
				+ "</p></div>\r\n" + "<p>감사합니다.</p></html>";

		String from = "kyw0300@naver.com";
		String password = "citibank0725";
		String to = mem.getMem_mail();

//		Email email = new SimpleEmail();
		Email email1 = new HtmlEmail();

		email1.setCharset("UTF-8");
		email1.setHostName("smtp.naver.com");
		email1.setSmtpPort(587);
		email1.setStartTLSEnabled(true);
		email1.setAuthentication(from, password);

		try {
			email1.setFrom(from);
			email1.addTo(to);
			email1.setSubject(context);
			email1.setContent(context4, "text/html; charset=UTF-8");

			email1.send();

		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("res", res);
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);

	}

}
