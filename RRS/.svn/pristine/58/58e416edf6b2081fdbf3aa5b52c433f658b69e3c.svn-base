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
import rrs.vo.RsMenuVO;

/**
 * Servlet implementation class SetReservMenu
 */
@WebServlet("/member/setReservMenu.do")
public class SetReservMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String jdata = request.getParameter("jdata");
		
		System.out.println(jdata);
		
		Gson gson = new Gson();
		RsMenuVO[] rsMenus = gson.fromJson(jdata, RsMenuVO[].class);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		
		int result = 0;
		for (int i = 0; i < rsMenus.length; i++) {
			result = service.setReservationToMenu(rsMenus[i]);
//			System.out.println(rsMenus[i].getRs_id());
//			System.out.println(rsMenus[i].getRst_id());
//			System.out.println(rsMenus[i].getMenu_id());
//			System.out.println(rsMenus[i].getRm_qty());
		}
		
		request.setAttribute("res", result);
		request.getRequestDispatcher("/restaurant/view/result.jsp").forward(request, response);
	}

}
