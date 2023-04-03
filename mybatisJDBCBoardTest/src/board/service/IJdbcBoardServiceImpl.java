package board.service;

import java.util.List;

import board.dao.IJdbcBoardDao;
import board.dao.IJdbcBoardDaoImpl;
import board.vo.JdbcBoardVO;



public class IJdbcBoardServiceImpl implements IJdbcBoardService{

	private IJdbcBoardDao dao;
	
	//1번
	private static IJdbcBoardServiceImpl service;
	
	//2번
	private IJdbcBoardServiceImpl(){
		dao = IJdbcBoardDaoImpl.getInstance();
	}
	
	//3번
	public static IJdbcBoardServiceImpl getInstance() {
		if(service == null) service = new IJdbcBoardServiceImpl();
		return service;
	}
	
	@Override
	public int insertBoard(JdbcBoardVO boardVo) {
		return dao.insertBoard(boardVo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}

	@Override
	public int updateBoard(JdbcBoardVO boardVo) {
		return dao.updateBoard(boardVo);
	}

	@Override
	public JdbcBoardVO getBoard(int boardNo) {
		// 게시글 보기에서는 조회수를 증가하는 작업이 같이 이루어져야함
		int cnt =dao.setCountIncrement(boardNo);
		if(cnt == 0) { // 조회수 증가 실패
			return null;
		}
		return dao.getBoard(boardNo);
	}

	@Override
	public List<JdbcBoardVO> getAllBoardList() {
		return dao.getAllBoardList();
	}

	@Override
	public List<JdbcBoardVO> getSearchBoardList(String title) {
		return dao.getSearchBoardList(title);
	}

	@Override
	public int setCountIncrement(int boardNo) {
		return dao.setCountIncrement(boardNo);
	}
	
	
	
	
	

}
