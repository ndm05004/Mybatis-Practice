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
import rrs.vo.ReservationDetailVO;

/**
 * Servlet implementation class ReservationDetail
 */
@WebServlet("/reservationDetail.do")
public class ReservationDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String rid = request.getParameter("id");
		
		System.out.println(rid);
		IRstService service = RstServiceImpl.getInstance();
		
		List<ReservationDetailVO> list = service.getReservDetail(rid);
		
		request.setAttribute("reservDetail", list);
		
		request.getRequestDispatcher("/restaurant/view/reservDetail.jsp").forward(request, response);
		
	}


}
