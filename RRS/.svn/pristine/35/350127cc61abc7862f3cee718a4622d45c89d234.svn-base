package rrs.member.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.MemberVO;

@WebServlet("/passSearch.do")
public class PassSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_mail(email);

		// 서비스 메서드 계정 있는지 확인
		IMemberService service = MemberServiceImpl.getInstance();

		String pass = service.searchPass(vo);
//		System.out.println(pass);

		int codeNum = 0;
		if (pass != null) {
			Random random = new Random();

			String code = "";
			String code1 = "";

			String ran1 = "";
			for (int i = 1; i <= 6; i++) {
				int ran = random.nextInt(10);
				ran1 = String.valueOf(ran);
				code1 += ran1;
				code += ran1;
				if (i != 6) {
					code += " ";
				}
			}

			codeNum = Integer.parseInt(code1);

//			System.out.println(code);
			String context = "인증번호 : " + code;
//			String imagePath = "D:/A_TeachingMaterial/3_highjava/workspace/RRS/src/main/webapp/images/로고.png";
//			String context2 = "<html><body><img src='/images/1aeff354-6da7-41b8-b463-a8dcc989df1e_cloud03.jpg'><h1 style=\"font-size:50px;\">"+ context +"</h1></body></html>";
			String context2 = "<html><body><h2 style=\"color: #ff3d00;\">TABLE MATE</h2><p>안녕하세요, TABLE MATE 입니다.<br> 비밀번호 찾기를 위한 인증번호입니다.</p>"
					+ "<h1 style=\"font-size:40px;color: #ff3d00;\">" + context + "</h1><br><p>올바른 인증번호를 입력해주세요.</p></body></html>";

			String from = "kyw0300@naver.com";
			String password = "citibank0725";
			String to = email;

//			Email email = new SimpleEmail();
			Email email1 = new HtmlEmail();

			email1.setCharset("UTF-8");
			email1.setHostName("smtp.naver.com");
			email1.setSmtpPort(587);
			email1.setStartTLSEnabled(true);
			email1.setAuthentication(from, password);

			try {
				email1.setFrom(from);
				email1.addTo(to);
				email1.setSubject("[TABLE MATE] 인증번호 메일입니다.");
//			email.setContent(context,"text/plain; charset=UTF-8");
				email1.setContent(context2, "text/html; charset=UTF-8");

//			EmailAttachment attachment = new EmailAttachment();
//			attachment.setPath(imagePath);
//			attachment.setDisposition(EmailAttachment.ATTACHMENT);
//			attachment.setDescription("이미지");
//			attachment.setName("image.jpg");
//			email.setc(attachment);

				email1.send();
			} catch (EmailException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		request.setAttribute("cernum", codeNum);
		request.setAttribute("pass", pass);
		request.getRequestDispatcher("/member/view/passSearch.jsp").forward(request, response);
	}

}
