package rrs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.ReservationVO;

/**
 * Servlet implementation class SetReservation
 */
@WebServlet("/member/setReservation.do")
public class SetReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid");
		String rid = request.getParameter("rid");
		int numOfPeople = Integer.parseInt(request.getParameter("numOfPeople"));
		String dateTime = request.getParameter("rdatetime")+" "+request.getParameter("time");
		
		System.out.println(mid);
		System.out.println(rid);
		System.out.println(numOfPeople);
		System.out.println(dateTime);
		
		ReservationVO vo = new ReservationVO();
		
		vo.setMem_id(mid);
		vo.setRs_datetime(dateTime);
		vo.setRs_people(numOfPeople);
		vo.setRst_id(rid);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int i = service.setReservation(vo);
		String rsid = null;
		if(i==1) {
			rsid = service.getRsId(vo);
		}
		request.setAttribute("rsid", rsid);
		
		request.getRequestDispatcher("/member/view/getRsId.jsp").forward(request, response);
	}

}
