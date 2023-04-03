package board.controller;

import java.util.List;
import java.util.Scanner;

import board.service.IJdbcBoardService;
import board.service.IJdbcBoardServiceImpl;
import board.vo.JdbcBoardVO;



public class JdbcBoardController {
	
	private Scanner sc;
	private IJdbcBoardService service;
	
	public JdbcBoardController() {
		// TODO Auto-generated constructor stub
		service = IJdbcBoardServiceImpl.getInstance();
		sc = new Scanner(System.in);
	}
	
	public static void main(String[] args) {
		new JdbcBoardController().startBoard();
	}
	
	
	public int displayMenu(String searchTitle) {
		System.out.println();
		System.out.println("-------------------------------------------------------------");
		System.out.println(" No	        제 목            작성자 	조회수   ");         
		System.out.println("-------------------------------------------------------------");
		
		List<JdbcBoardVO> list = null;
		
		if(searchTitle == null) {
			list = service.getAllBoardList();
		}else {			
			list = service.getSearchBoardList(searchTitle);
		}
		

		if (list == null || list.size() == 0) {
			System.out.println("등록된 회원 정보가 하나도 없습니다....");
		} else {
			for (JdbcBoardVO boardVO : list) {
				System.out.println(boardVO.getBoardNo() +"\t"
									+ boardVO.getBoardTitle() +"\t"
									+ boardVO.getBoardTitle() +"\t"
									+ boardVO.getBoardCnt());
			}
		}
		
		System.out.println("-------------------------------------------------------------");
		
		System.out.println("메뉴 : 1. 새글작성     2. 게시글보기    3. 검색    0. 작업끝");
		System.out.println("작업선택 >> ");
		int select = sc.nextInt();
		
		return select;
		
	}
 	
	
	public void startBoard() {
		String title = null;

		int select = displayMenu(title);
	
			
			switch (select) {
			case 1: // 새글 작성
				insertBoard();
				title = null;
				break;
			case 2: // 게시글 보기
				viewBoard();
				title = null;
				break;
			case 3: // 검색
				title = serchBoard();
				break;
			case 0: // 작업 끝
				System.out.println("게시판 프로그램 종료");
				return;
				
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력하세요");
			}
			
		}
	

	// 게시글 검색 메서드
	private String serchBoard() {
		
		sc.nextLine();
		System.out.println();
		System.out.println("검색 작업");
		System.out.println("------------------------");
		System.out.println("검색할 제목 입력");
		String title = sc.nextLine();
	
		return title;
	}

	private void viewBoard() {
		
		System.out.println("보기를 원하는 게시물 번호 입력 >>");
		int boardNo = sc.nextInt();
		
		JdbcBoardVO boardVO = service.getBoard(boardNo);
		
		if(boardVO ==null) {
			System.out.println(boardNo + "번의 게시글은 존재하지 않습니다...");
			return;
		}
		
		System.out.println();
		System.out.println("-----------------------------------");
		System.out.println(boardNo + "번 글의 내용");
		System.out.println("-----------------------------------");
		System.out.println("- 제  목 : " + boardVO.getBoardTitle());
		System.out.println("- 작성자 : " + boardVO.getBoardWriter() );
		System.out.println("- 내  용 : " + boardVO.getBoardContent());
		System.out.println("- 작성일 : " + boardVO.getBoardDate());
		System.out.println("- 조회수 : " + boardVO.getBoardCnt());
		System.out.println("-----------------------------------");
		
		System.out.println("메뉴 : 1. 수정    2. 삭제    3. 리스트로 가기");
		int menu = sc.nextInt();
		
		switch (menu) {
		case 1:
			updateBoard(boardNo);
			break;
		case 2:
			deleteBoard(boardNo);
			break;
		case 3:
			return;

		default:
			break;
		}		
	}

	private void deleteBoard(int boardNo) {
		
		int cnt = service.deleteBoard(boardNo);
		
		if(cnt>0) {
			System.out.println(boardNo + "번 글이 삭제되었습니다...");
		}else {			
			System.out.println(boardNo + "번 글 삭제 실패...");
		}		
		
	}
	
	// 게시글을 수정하는 메서드
	private void updateBoard(int boardNo) {
		
		sc.nextLine(); // 버퍼 비우기
		System.out.println();
		System.out.println("수정 작업하기");
		System.out.println("-------------------------");
		System.out.print("- 제 목 :");
		String title = sc.nextLine();
		
		System.out.print("- 내 용 :");
		String content = sc.nextLine();
		
		JdbcBoardVO boardVo = new JdbcBoardVO();
		boardVo.setBoardNo(boardNo);
		boardVo.setBoardTitle(title);
		boardVo.setBoardContent(content);
		
		int cnt = service.updateBoard(boardVo);
		
		if(cnt>0) {
			System.out.println(boardNo + "번 글이 수정되었습니다...");
		}else {			
			System.out.println(boardNo + "번 글 수정 실패..");
		}
		
	}

	// 새글을 작성하는 메서드
	private void insertBoard() {
		
		System.out.println("새글 작성하기");
		System.out.println("-----------------------------------");
		sc.nextLine(); // 입력 버퍼 지우기
		
		System.out.print("- 제 목 :");
		String title = sc.nextLine();
		
		System.out.print("- 작성자 :");
		String author = sc.nextLine();
		
		System.out.print("- 내 용 :");
		String content = sc.nextLine();
		
		// 입력 받은 자료를 VO에 저장하기
		
		JdbcBoardVO vo = new JdbcBoardVO();
		vo.setBoardTitle(title);
		vo.setBoardWriter(author);
		vo.setBoardContent(content);
		
		int cnt =service.insertBoard(vo);
		
		if(cnt > 0) {
			System.out.println("새글이 추가 되었습니다.");
		} else {
			System.out.println("추 가 실 패");
		}
		
	}

}
