package rrs.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rrs.util.MybatisSqlSessionFactory;
import rrs.vo.CmtVO;
import rrs.vo.ReservationVO;
import rrs.vo.ReviewVO;
import rrs.vo.RsMenuVO;

public class MemberDaoImpl implements IMemberDao {
	private static IMemberDao instance;
	private MemberDaoImpl() {}
	
	public static IMemberDao getInstance() {
		if(instance == null) instance = new MemberDaoImpl();
		return instance;
	}

	@Override
	public int insertrsv(ReservationVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("reservation.insertrsv",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertrsvmenu(RsMenuVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("reservation.insertrsvmenu",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewVO> selectRvList(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int rvNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCmt(CmtVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CmtVO> selectCmtList(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCmt(CmtVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCmt(int cmtNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
