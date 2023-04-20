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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import rrs.rstaurant.service.IRstService;
import rrs.rstaurant.service.RstServiceImpl;
import rrs.vo.RestautantVO;
import rrs.vo.RsttagVO;

/**
 * Servlet implementation class UpdateRstInfo
 */
@WebServlet("/updateRstInfo.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024
		* 100)
public class UpdateRstInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		RestautantVO vo = new RestautantVO();

		vo.setBs_num(request.getParameter("bsnum"));
		vo.setRst_name(request.getParameter("name"));
		
		String rstId = request.getParameter("id");
		vo.setRst_id(rstId);
		
		
		vo.setRst_tel(request.getParameter("tel"));
		vo.setRst_mail(request.getParameter("mail"));
		vo.setClosedday(request.getParameter("holiday"));
		vo.setOpnetme(request.getParameter("opentime"));
		vo.setClosetime(request.getParameter("closetime"));
		vo.setCtg_id(request.getParameter("ctg"));
		vo.setRst_pass(request.getParameter("pass"));

		

		vo.setRst_info(request.getParameter("info"));
		vo.setRst_addr(request.getParameter("add1") +" "+ request.getParameter("add2"));

		String uploadPath = "D:\\A_TeachingMaterial\\3_highjava\\workspace\\RRS\\src\\main\\webapp\\images";

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
		
		int updateRst = service.updateRst(vo);
		int result = 0;
		if(updateRst==1) {
			String[] values = request.getParameterValues("tagLt");
			service.deleteRstTag(rstId);
			for (String tagId : values) {
				RsttagVO rsttagVO = new RsttagVO();
				rsttagVO.setRst_id(rstId);
				rsttagVO.setTag_id(tagId);
				
				result =service.insertRstTagList(rsttagVO);
			}
		}
		HttpSession session  = request.getSession();
		session.setAttribute("loginRst", vo);
		
		response.sendRedirect(request.getContextPath()+"/restaurant/view/updateRstResult.jsp");
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
