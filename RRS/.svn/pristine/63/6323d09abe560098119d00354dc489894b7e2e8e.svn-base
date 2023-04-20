package rrs.member.controller;

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

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.ReviewVO;

@WebServlet("/reviewInsert.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 100)

public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// -----------------------------------------------------------------------------------------------
		// 업로드된 파일이 저장될 폴더 설정
//		String uploadPath = "d:/d_other/uploadFiles";
		String uploadPath = "D:\\A_TeachingMaterial\\3_highjava\\workspace\\RRS\\src\\main\\webapp\\images";

		// 저장될 폴더가 없으면 새로 만든다.
		File f = new File(uploadPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		// 수신 받은 파일 데이터 처리하기
		String fileName = ""; // 파일명이 저장될 변수 선언
		String saveFileName = null;
		// 전체 Part객체 개수만큼 반복 처리하기
		for (Part part : request.getParts()) {
			fileName = extractFileName(part);

			// 찾은 파일명이 빈문자열("")이면 이것은 파일이 아닌 일반 파라미터 데이터라는 의미이다.
			if (!"".equals(fileName)) { // 파일인지 검사
				System.out.println("filename: " + fileName);
				// 1개의 Upload파일에 대한 정보를 저장하기 위한 VO객체 생성
				ReviewVO rvo = new ReviewVO();

				rvo.setRv_photo(fileName); // 실제 파일명을 VO에 저장

				// 실제 저장되는 파일 이름이 중복되는 것을 방지하기 위해서 UUID객체를 이용하여
				// 저장할 파일명을 만든다.
				saveFileName = UUID.randomUUID().toString() + "_" + fileName;

				// part.getSize() ==> Upload된 파일의 크기를 반환한다. (단위 : byte)

				// 파일 크기를 구해서 KB단위로 변환해서 VO에 저장한다.
				rvo.setRv_photoSize(((long) Math.ceil(part.getSize() / 1024.0)));

				// 수신 받은 파일 내용을 저장한다.
				try {
					// part.write()메서드 ==> Upload된 파일을 저장하는 메서드
					part.write(uploadPath + File.separator + saveFileName); // 파일 저장하기...
				} catch (Exception e) {
					e.printStackTrace();
				}

//				fileList.add(fvo); // upload된 파일 정보를 List에 추가

			} // if문 끝...

		} // for문 끝...
		
		String memid = request.getParameter("id");
		String rsid = request.getParameter("rsid");
		int star = Integer.parseInt(request.getParameter("reviewStar"));
		String cont = request.getParameter("reviewContents");
		
		ReviewVO vo = new ReviewVO();
		vo.setMem_id(memid);
		vo.setRs_id(rsid);
		vo.setRv_sc(star);
		vo.setRv_content(cont);
		vo.setRv_photo(saveFileName);
		
//		System.out.println(vo.getMem_id());
//		System.out.println(vo.getRv_content());
//		System.out.println(vo.getRv_sc());
//		System.out.println(vo.getRs_id());
//		System.out.println(vo.getRv_photo());
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.insertReview(vo);
		
		int cnt2 = service.starAvgUpdate(rsid);
		
//		request.setAttribute("result", cnt);
//		request.getRequestDispatcher("/member/view/result.jsp").forward(request, response);
		
		response.sendRedirect(request.getContextPath() + "/member/memMyPage.jsp");
		
	}
	
	// Part구조 안에서 파일명을 찾는 메서드
		private String extractFileName(Part part) {
			
			String fileName = ""; // 반환할 파일명이 저장될 변수
			String headerValue = part.getHeader("content-disposition"); // 헤더의 '키값'을 이용하여 값을 구한다.
			
			String[] items = headerValue.split(";");
			for(String item : items) {
				if(item.trim().startsWith("filename")) {
					fileName = item.substring(item.indexOf("=")+2, item.length()-1);
				}
			}
			
			return fileName;
		}
}
