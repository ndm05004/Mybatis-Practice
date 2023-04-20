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
import rrs.vo.ReviewVO;
import rrs.vo.RstcmtVO;

/**
 * Servlet implementation class ReviewAll
 */
@WebServlet("/reviewAll.do")
public class ReviewAll extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String id = request.getParameter("id");
      int more = Integer.parseInt( request.getParameter("more"));
      
      System.out.println(id);
      System.out.println(more);
      
      IRstService service = RstServiceImpl.getInstance();
      
      ReviewVO vo = new ReviewVO();
      
      vo.setRst_id(id);
      vo.setMore(more);
      
      List<ReviewVO> list = service.reviewAll(vo);
      
      
      for(int i=0; i<list.size(); i++) {
         List<RstcmtVO> rstlist = service.showReply(list.get(i).getRv_id());
         list.get(i).setRstcmtlist(rstlist);
      }
      
      
      request.setAttribute("review", list);
      
      request.getRequestDispatcher("/restaurant/view/reviewAll.jsp").forward(request, response);
      
      
      
      
      
      
   }

}