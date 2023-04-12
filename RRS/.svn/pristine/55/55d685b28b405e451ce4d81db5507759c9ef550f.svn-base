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
import rrs.vo.ReservationVO;

/**
 * Servlet implementation class ScheduleInfo
 */
@WebServlet("/ScheduleInfo.do")
public class ScheduleInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String rstId = request.getParameter("id");
		
		IRstService service = RstServiceImpl.getInstance();

		List<ReservationVO> list = service.getReservation(rstId);

		request.setAttribute("reservList", list);

		request.getRequestDispatcher("/restaurant/view/reservInfo.jsp").forward(request, response);
	}
}
