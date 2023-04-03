package board.service;

import java.util.List;

import board.vo.JdbcBoardVO;

public interface IJdbcBoardService {
	/**
	 * IJdbcBoardVO객체에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param boardVo Db에 insert할 자료가 저장된 jdbcBoardVO객체
	 * @return 작업성공 1, 작업실패0
	 */
	public int insertBoard(JdbcBoardVO boardVo);
	
	
	
	/**
	 * 게시글 번호를 배개변수로 받아서 해당 게시글 정보를 삭제하는 메서드
	 * 
	 * @param 삭제할 게시글 번호
	 * @return 성공1, 실패 0 
	 */
	public int deleteBoard(int boardNo);
	
	
	/**
	 * 선택한 게시글을 업데이트 하는 메서드
	 * @param boardVo 수정할 데이터가 저장될 JdbcBoardVO객체
	 * @return 작업성공:1, 작업실패:0
	 */
	public int updateBoard(JdbcBoardVO boardVo);
	
	/**
	 * 선택한 게시글을 자세하게 보는 메서드
	 * @param boardNo 가져올 게시글번호
	 * @return 해당 게시글 자료가 있으면 해당 게시글 정보가 저장된 JdbcBoardVO객체,
	 * 		   자료가 없으면 null
	 */
	public JdbcBoardVO getBoard(int boardNo);

	
	/**
	 * 전체 게시글을 조회하는 메서드
	 * @return
	 */
	public List<JdbcBoardVO> getAllBoardList();
	
	public List<JdbcBoardVO> getSearchBoardList(String title);
	
	public int setCountIncrement(int boardNo);

}
