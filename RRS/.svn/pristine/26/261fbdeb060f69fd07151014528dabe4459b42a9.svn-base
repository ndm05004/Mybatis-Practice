package rrs.rstaurant.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MenuImg
 */
@WebServlet("/menuImg.do")
public class MenuImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String photo = request.getParameter("photo");
		

		String uploadPath = "D:\\A_TeachingMaterial\\3_highjava\\workspace\\RRS\\src\\main\\webapp\\images";

		File file = new File(uploadPath);
		if (!file.exists()) {
			file.mkdir();
		}

		String imgPath = uploadPath + File.separator + photo;
		File imgFile = new File(imgPath);

		if (imgFile.exists()) {// 이미지 파일이 있을 때
			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;
			try {
				// 출력용 스트림 객체 생성
				bout = new BufferedOutputStream(response.getOutputStream());
				bin = new BufferedInputStream(new FileInputStream(imgFile));

				byte[] temp = new byte[1024];
				int len = 0;
				while ((len = bin.read(temp)) > 0) {
					bout.write(temp);
				}
				bout.flush();

			} catch (Exception e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if (bout != null) {
					try {
						bout.close();
					} catch (Exception e2) {
					}
				}
				if (bin != null) {
					try {
						bin.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
