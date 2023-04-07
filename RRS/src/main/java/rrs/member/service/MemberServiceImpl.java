package rrs.member.service;

import java.util.List;

import rrs.member.dao.IMemberDao;
import rrs.member.dao.MemberDaoImpl;
import rrs.vo.CmtVO;
import rrs.vo.ReservationVO;
import rrs.vo.ReviewVO;
import rrs.vo.RsMenuVO;

public class MemberServiceImpl implements IMemberService {
	private IMemberDao dao;
	private static IMemberService instance;
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(instance == null) instance = new MemberServiceImpl();
		return instance;
	}

	@Override
	public int insertrsv(ReservationVO vo) {
		return dao.insertrsv(vo);
	}

	@Override
	public int insertrsvmenu(RsMenuVO vo) {
		return dao.insertrsvmenu(vo);
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