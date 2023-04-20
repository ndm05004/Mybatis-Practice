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
import rrs.vo.RestautantVO;

@WebServlet("/RstView.do")
public class RstView extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      response.setContentType("utf-8");
      
      String id = request.getParameter("rst_id");
      IMemberService service = MemberServiceImpl.getInstance();

      RestautantVO vo = service.findRst(id);

      request.setAttribute("vo", vo);
      
      request.getRequestDispatcher("/member/rst-select/select-restaurant.jsp").forward(request, response);

   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}