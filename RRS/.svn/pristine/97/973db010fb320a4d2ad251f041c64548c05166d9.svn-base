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
import rrs.vo.RestautantVO;

/**
 * Servlet implementation class ModifyRst
 */
@WebServlet("/modifyRst.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024
* 100)
public class ModifyRst extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("rstid");
		String name = request.getParameter("rstname");
		String pass = request.getParameter("rstpass");
		String addr = request.getParameter("rstaddr");
		String info = request.getParameter("rstinfo");
		String mail = request.getParameter("rstmail");
		String tel = request.getParameter("rsttel");
		String close = request.getParameter("rstclose");
		String open = request.getParameter("restopen");
		String cltime = request.getParameter("restcltime");
		String ctg = request.getParameter("rstctg");

		RestautantVO vo = new RestautantVO();
		vo.setRst_id(id);
		vo.setRst_pass(pass);
		vo.setRst_name(name);
		vo.setRst_addr(addr);
		vo.setRst_info(info);
		vo.setRst_mail(mail);
		vo.setRst_tel(tel);
		vo.setClosedday(close);
		vo.setClosetime(cltime);
		vo.setOpnetme(open);
		vo.setCtg_id(ctg);
		
		String uploadPath = "D:\\A_TeachingMatrial\\3_highjava\\workspace\\RRS\\src\\main\\webapp\\images";

		File file = new File(uploadPath);
		if (!file.exists()) {
			file.mkdir();
		}

		String fileName = "";

		for (Part part : request.getParts()) {
			fileName = extractFileName(part);
			if (!"".equals(fileName)) {
				String saveFileName = UUID.randomUUID().toString() + "_" + fileName;
				vo.setRst_photo(saveFileName);
				try {
					// part.write()매서드 => Upload된 파일을 저장하는 매서드
					part.write(uploadPath + File.separator + saveFileName); // 파일 저장하기...
				} catch (Exception e) {
					System.out.println("파일 오류 " + e.getMessage());
				}
			}
		}

		IRstService service = RstServiceImpl.getInstance();

		int result = service.updateRst(vo);
		System.out.println(result);

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
