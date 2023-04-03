package board.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.vo.JdbcBoardVO;
import kr.or.ddit.util.MybatisSqlSessionFactory;



public class IJdbcBoardDaoImpl implements IJdbcBoardDao {

	private static IJdbcBoardDaoImpl boardDao;
	
	private IJdbcBoardDaoImpl() {
	}
	
	public static IJdbcBoardDaoImpl getInstance() {
		if(boardDao==null) boardDao = new IJdbcBoardDaoImpl();
		return boardDao;
	
	}
	
	@Override
	// prameterType = 매개변수  JdbcBoardVO boardVo
	// resultType = int return 타입 
	public int insertBoard(JdbcBoardVO boardVo) {
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("board.insertBoard", boardVo);
		} finally {
			session.commit();
			session.close();	
		}

		return cnt;
	}

	@Override
	public int deleteBoard(int boardNo) {
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("board.deleteBoard", boardNo);
		} finally {
			session.commit();
			session.close();	
		}

		return cnt;
	}

	@Override
	public int updateBoard(JdbcBoardVO boardVo) {
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("board.updateBoard", boardVo);
		} finally {
			session.commit();
			session.close();	
		}

		return cnt;
	}

	@Override
	public JdbcBoardVO getBoard(int boardNo) {
		SqlSession session = null;
		JdbcBoardVO vo = new JdbcBoardVO();
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("board.getBoard", boardNo);
		} finally {
			session.commit();
			session.close();	
		}

		return vo;
	}

	@Override
	public List<JdbcBoardVO> getAllBoardList() {
		SqlSession session = null;
		List<JdbcBoardVO> volist = new ArrayList<>();
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
	
			volist = session.selectList("board.getAllBoardList");
		} finally {
			session.commit();
			session.close();	
		}

		return volist;
	}

	
	public List<JdbcBoardVO> getSearchBoardList(String title) {
		
		SqlSession session = null;
		List <JdbcBoardVO> boardList; // 반환값 변수
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			boardList = session.selectList("board.getSearchBoardList", title);
		} finally {
			session.commit();
			session.close();	
		}

		return boardList;
	}

	

	@Override
	public int setCountIncrement(int boardNo) {
		
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("board.setCountIncrement", boardNo);
		} finally {
			session.commit();
			session.close();	
		}

		return cnt;
	}


}
