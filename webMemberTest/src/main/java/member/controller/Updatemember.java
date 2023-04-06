package member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import member.service.IMemberService;
import member.service.MemberService;
import member.vo.MemberVo;

/**
 * Servlet implementation class Updatemember
 */
@WebServlet("/updatemember.do")
public class Updatemember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
		String mem_name = request.getParameter("mem_name");
		String mem_tel = request.getParameter("mem_tel");
		String mem_addr = request.getParameter("mem_addr");
		MemberVo vo = new MemberVo();
		vo.setMem_id(mem_id);
		vo.setMem_addr(mem_addr);
		vo.setMem_name(mem_name);
		vo.setMem_pass(mem_pass);
		vo.setMem_tel(mem_tel);

		   //업로드된 파일이 저장될 폴더 설정
        String uploadPath = "d:/d_other/uploadFiles";

        //저장될 폴더가 없으면 새로 만든다.
        File f = new File(uploadPath);
        if(!f.exists()) {
           f.mkdirs();
        }
        
        //수신 받을 파일 데이터 처리하기
        String fileName = "";     //파일명이 저장될 변수 선언
        
        
        //전체 Part객체 개수만큼 반복 처리하기 
        for (Part part : request.getParts()) {
           fileName = extractFileName(part);
           
           
           if(!"".equals(fileName)) { //파일인지 검사
              
              
              //이 값을 VO에 저장 파일명으로 저장한다.
              vo.setMem_photo(fileName);
              
           
              try {
                 //part.write()메소드 ==> Upload된 파일을 저장하는 메소드
                 part.write(uploadPath + File.separator + fileName ); //파일 저장하기
              } catch (Exception e) {
                 e.printStackTrace();
              }
              
           } //if문 끝
        } //for문 끝

		IMemberService service = MemberService.getInstance();
		
		int cnt = service.updateMember(vo);
		
		if(cnt>0) {
			response.sendRedirect(request.getContextPath() + "/memberList.do");
		}
				
	}


private String extractFileName(Part part) {
    String fileName = ""; //반환할 파일명이 저장될 변수
    String headerValue = part.getHeader("content-disposition"); //헤더의 '키값'을 이용하여 값을 구한다.
    
    String[] items = headerValue.split(";");
    for (String item : items) {
       if(item.trim().startsWith("filename")) {
          fileName = item.substring(item.indexOf("=")+2, item.length() -1);
       }
    }
 
    return fileName;
 }
}