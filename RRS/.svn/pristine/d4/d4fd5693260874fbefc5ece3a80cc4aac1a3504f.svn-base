package rrs.rstaurant.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.MenuVO;

/**
 * Servlet implementation class MenuUpdate
 */
@WebServlet("/menuUpdate.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024
* 100)
public class MenuUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String menuName = request.getParameter("modName");
		int menuPrice = Integer.parseInt(request.getParameter("modPrice"));
		String menuDs = request.getParameter("modDs");
		int menuId = Integer.parseInt(request.getParameter("menuDetailId"));
		String rstId = request.getParameter("rstId");
		
		
		MenuVO vo = new MenuVO();
		
		vo.setMenu_ds(menuDs);
		vo.setMenu_id(menuId);
		vo.setMenu_name(menuName);
		vo.setRst_id(rstId);
		vo.setMenu_price(menuPrice);
		
		String uploadPath = "D:\\A_TeachingMaterial\\3_highjava\\workspace\\RRS\\src\\main\\webapp\\images";

		File file = new File(uploadPath);
		if (!file.exists()) {
			file.mkdir();
		}

		String fileName = "";

		for (Part part : request.getParts()) {
			fileName = extractFileName(part);
			if (!"".equals(fileName)) {
				System.out.println(fileName);
				String saveFileName = UUID.randomUUID().toString() + "_" + fileName;
				vo.setMenu_photo(saveFileName);
				try {
					// part.write()매서드 => Upload된 파일을 저장하는 매서드
					part.write(uploadPath + File.separator + saveFileName); // 파일 저장하기...
				} catch (Exception e) {
					System.out.println("파일 오류 " + e.getMessage());
				}
			}
		}

		IRstService service = RstServiceImpl.getInstance();

		int res = service.updateMenu(vo);
		
		request.setAttribute("res", res);

		response.sendRedirect(request.getContextPath() + "/restaurant/rstmain.jsp");
	}
	
	private String extractFileName(Part part) {
		String fileName = ""; // 반환할 파일명이 저장될 변수
		String headerValue = part.getHeader("content-disposition"); // 해더의 '키값'을 이용하여 값을 구한다.

		String[] items = headerValue.split(";"); // ";"으로 스플릿한다
		for (String item : items) {
			if (item.trim().startsWith("filename")) {// filename으로 시작하는지 구분한다.
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return fileName;
	}

}
