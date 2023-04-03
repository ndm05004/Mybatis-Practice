package kr.or.ddit.reqNresp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/requestTest02.do")
public class requestTest02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String firstNum = request.getParameter("firstNum");
		String op = request.getParameter("op");
		String seconNum = request.getParameter("seconNum");
		
		double result = 0;
		boolean calcOK = true; // 계산 성공 여부를 나타내는 변수
		
		switch (op) {
		case "+":
			result = Integer.parseInt(firstNum) + Integer.parseInt(seconNum);
			break;
		case "-":
			result = Integer.parseInt(firstNum) - Integer.parseInt(seconNum);
			break;
		case "*":
			result = Integer.parseInt(firstNum) * Integer.parseInt(seconNum);
			break;
		case "/":
			if(Integer.parseInt(seconNum)==0) {
				calcOK = false;
			}else {
				result =(double)Integer.parseInt(firstNum) / Integer.parseInt(seconNum);
				calcOK = true;
			}
			break;
		case "%":
			if(Integer.parseInt(seconNum)==0) {
				calcOK = false;
			}else {
				result =(double)Integer.parseInt(firstNum) % Integer.parseInt(seconNum);
				calcOK = true;
			}
			break;

		default:
	 		break;
		}
				
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.println("<html><head><meta charset='utf-8'><title>Request객체 연습2</title></head>");
		out.println("<body>");
		out.println("<h3>처리 결과 </h3><hr>");
		out.println("<p>" +firstNum+op+seconNum+"=");
		if(calcOK==true) {
			out.println(result);
		}else {
			out.println("계산 불능 (0으로 나누기)");
		}
		out.println("</body>");
		out.println("</html>");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
