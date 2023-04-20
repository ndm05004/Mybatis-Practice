package rrs.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rrs.util.MybatisSqlSessionFactory;
import rrs.vo.BookmarkVO;
import rrs.vo.CmtVO;
import rrs.vo.IqrVO;
import rrs.vo.MemberVO;
import rrs.vo.ReservationDetailVO;
import rrs.vo.ReservationVO;
import rrs.vo.RestautantVO;
import rrs.vo.ReviewVO;
import rrs.vo.RsMenuVO;
import rrs.vo.RvrepotVO;
import rrs.vo.SearchVO;

public class MemberDaoImpl implements IMemberDao {
	private static IMemberDao instance;

	private MemberDaoImpl() {
	}

	public static IMemberDao getInstance() {
		if (instance == null)
			instance = new MemberDaoImpl();
		return instance;
	}

	@Override
	public int insertrsv(ReservationVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("reservation.insertrsv", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			cnt = session.insert("reservation.insertrsvmenu", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public int insertReview(ReviewVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("member.insertReview", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<ReviewVO> selectRvList(ReviewVO vo) {
		SqlSession session = null;
		List<ReviewVO> rList = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			rList = session.selectList("member.selectRvList", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return rList;
	}

	@Override
	public int updateReview(ReviewVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("member.updateReview", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteReview(int rvNum) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("member.deleteReview", rvNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
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

	@Override
	public int memberIdCheck(String memId) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int count = 0;

		try {
			count = session.selectOne("member.memberIdCheck", memId);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	@Override
	public String searchId(MemberVO vo) {
		SqlSession session = null;
		String memId = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			memId = session.selectOne("member.searchId", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return memId;
	}

	@Override
	public String searchPass(MemberVO vo) {
		SqlSession session = null;
		String memPass = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			memPass = session.selectOne("member.searchPass", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return memPass;
	}

	@Override
	public int newPassSet(MemberVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("member.newPassSet", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertMember(MemberVO memVo) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int cnt = 0;

		try {
			cnt = session.insert("member.insertMember", memVo);
			if (cnt > 0)
				session.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	@Override
	public List<SearchVO> searchRst(String content) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<SearchVO> vo = null;

		try {
			vo = session.selectList("member.searchRst", content);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		SqlSession session = null;
		MemberVO memVo = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			memVo = session.selectOne("member.loginCheck", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return memVo;
	}

	@Override
	public int boardInsert(IqrVO vo) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int cnt = 0;

		try {
			cnt = session.insert("member.boardInsert", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public RestautantVO findRst(String id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		RestautantVO vo = null;

		try {
			vo = session.selectOne("member.findRst", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	@Override
	public int updateMember(MemberVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("member.updateMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteMember(String id) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("member.deleteMember", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public ReviewVO selectReview(int rvNum) {
		SqlSession session = null;
		ReviewVO reviewVo = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			reviewVo = session.selectOne("member.selectReview", rvNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return reviewVo;
	}

	@Override
	public List<ReservationDetailVO> selectRsvList(String id) {
		SqlSession session = null;
		List<ReservationDetailVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.selectRsvList", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<IqrVO> selectIqrList(String id) {
		SqlSession session = null;
		List<IqrVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.selectIqrList", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RsMenuVO> selectRsMenuList(String rs_id) {
		SqlSession session = null;
		List<RsMenuVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.selectRsMenuList", rs_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<RestautantVO> selectBookmark(String id) {
		SqlSession session = null;
		List<RestautantVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.selectBookmark", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	@Override
	public IqrVO iqrInfoView(int id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		IqrVO vo = null;

		try {
			vo = session.selectOne("member.iqrInfoView", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	@Override
	public int iqrDelete(int id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int cnt = 0;
		try {
			cnt = session.delete("member.iqrDelete", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public int iqrUpdate(IqrVO vo) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int cnt = 0;

		try {
			cnt = session.update("member.iqrUpdate", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public int rsvDelete(String rsid) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("member.rsvDelete", rsid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int starAvgUpdate(String rsid) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("member.starAvgUpdate", rsid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<ReviewVO> rstreview(String rstid) {
		SqlSession session = null;
		List<ReviewVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("select-rst.rstreview", rstid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	@Override
	public int setReservation(ReservationVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("member.setReservation", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public String getRsId(ReservationVO vo) {
		SqlSession session = null;
		String rsid = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			rsid = session.selectOne("member.getRsId", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return rsid;
	}

	@Override
	public int setReservationToMenu(RsMenuVO rsMenuVO) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("member.setReservationToMenu", rsMenuVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int blackListUpdate(String memid) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int cnt = 0;

		try {
			cnt = session.update("member.blackListUpdate", memid);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public int memberReport(String memid) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int cnt = 0;

		try {
			cnt = session.update("member.memberReport", memid);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public int memberReviewReport(RvrepotVO vo) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.insert("member.memberReviewReport", vo);
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int didIDoMyFavorites(BookmarkVO vo) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.selectOne("member.didIDoMyFavorites", vo);
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int addBookMark(BookmarkVO vo) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.insert("member.addBookMark", vo);
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int cancelBookMark(BookmarkVO vo) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.delete("member.cancelBookMark", vo);
		} finally {
			session.close();
		}
		return res;
	}
	
	   @Override
	   public int bookMarkInsert(BookmarkVO bkvo) {
	      SqlSession session = null;
	      int res = 0;
	      try {
	         session = MybatisSqlSessionFactory.getSqlSession();
	         res = session.insert("member.bookMarkInsert", bkvo);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         session.close();
	      }
	      return res;
	   }

	   @Override
	   public List<BookmarkVO> bookMarkCheck(String id) {
	      SqlSession session = MybatisSqlSessionFactory.getSqlSession();
	      List<BookmarkVO> list = null;
	      try {
	         list = session.selectList("member.bookMarkCheck", id);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         session.close();
	      }
	      return list;
	   }

	   @Override
	   public int bookMarkDelete(BookmarkVO bkvo) {
	      SqlSession session = MybatisSqlSessionFactory.getSqlSession();
	      int cnt = 0;

	      try {
	         cnt = session.delete("member.bookMarkDelete", bkvo);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         session.close();
	      }
	      return cnt;
	   }
}
