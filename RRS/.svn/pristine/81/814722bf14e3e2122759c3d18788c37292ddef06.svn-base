package rrs.member.service;

import java.util.List;

import rrs.member.dao.IMemberDao;
import rrs.member.dao.MemberDaoImpl;
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

public class MemberServiceImpl implements IMemberService {
	private IMemberDao dao;
	private static IMemberService instance;

	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}

	public static IMemberService getInstance() {
		if (instance == null)
			instance = new MemberServiceImpl();
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
		return dao.insertReview(vo);
	}

	@Override
	public List<ReviewVO> selectRvList(ReviewVO vo) {
		return dao.selectRvList(vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return dao.updateReview(vo);
	}

	@Override
	public int deleteReview(int rvNum) {
		return dao.deleteReview(rvNum);
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
		return dao.memberIdCheck(memId);
	}

	@Override
	public String searchId(MemberVO vo) {
		return dao.searchId(vo);
	}

	@Override
	public String searchPass(MemberVO vo) {
		return dao.searchPass(vo);
	}

	@Override
	public int newPassSet(MemberVO vo) {
		return dao.newPassSet(vo);
	}

	@Override
	public int insertMember(MemberVO memVo) {
		return dao.insertMember(memVo);
	}

	@Override
	public List<SearchVO> searchRst(String content) {
		return dao.searchRst(content);
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}

	@Override
	public int boardInsert(IqrVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public RestautantVO findRst(String id) {
		return dao.findRst(id);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}

	@Override
	public int deleteMember(String id) {
		return dao.deleteMember(id);
	}

	@Override
	public ReviewVO selectReview(int rvNum) {
		return dao.selectReview(rvNum);
	}

	@Override
	public List<ReservationDetailVO> selectRsvList(String id) {
		return dao.selectRsvList(id);
	}

	@Override
	public List<IqrVO> selectIqrList(String id) {
		return dao.selectIqrList(id);
	}

	@Override
	public List<RsMenuVO> selectRsMenuList(String rs_id) {
		return dao.selectRsMenuList(rs_id);
	}

	@Override
	public List<RestautantVO> selectBookmark(String id) {
		return dao.selectBookmark(id);
	}

	@Override
	public IqrVO iqrInfoView(int id) {
		return dao.iqrInfoView(id);
	}

	@Override
	public int iqrDelete(int id) {
		return dao.iqrDelete(id);
	}

	@Override
	public int iqrUpdate(IqrVO vo) {
		return dao.iqrUpdate(vo);
	}

	@Override
	public int rsvDelete(String rsid) {
		return dao.rsvDelete(rsid);
	}

	@Override
	public int starAvgUpdate(String rsid) {
		return dao.starAvgUpdate(rsid);
	}

	@Override
	public List<ReviewVO> rstreview(String rstid) {
		// TODO Auto-generated method stub
		return dao.rstreview(rstid);
	}

	@Override
	public int setReservation(ReservationVO vo) {
		return dao.setReservation(vo);
	}

	@Override
	public String getRsId(ReservationVO vo) {
		return dao.getRsId(vo);
	}

	@Override
	public int setReservationToMenu(RsMenuVO rsMenuVO) {
		return dao.setReservationToMenu(rsMenuVO);
	}

	@Override
	public int blackListUpdate(String memid) {
		return dao.blackListUpdate(memid);
	}

	@Override
	public int memberReport(String memid) {
		return dao.memberReport(memid);
	}

	@Override
	public int memberReviewReport(RvrepotVO vo) {
		return dao.memberReviewReport(vo);
	}

	@Override
	public int memberStUpdate(String memid, RvrepotVO vo) {

		int cmt = blackListUpdate(memid) + memberReport(memid) + memberReviewReport(vo);
		System.out.println(memid);
		System.out.println(cmt);

		return cmt;
	}

	@Override
	public int didIDoMyFavorites(BookmarkVO vo) {
		return dao.didIDoMyFavorites(vo);
	}
	
	@Override
	public int addBookMark(BookmarkVO vo) {
		return dao.addBookMark(vo);
	}
	
	@Override
	public int cancelBookMark(BookmarkVO vo) {
		return dao.cancelBookMark(vo);
	}

	@Override
	public int bookMarkInsert(BookmarkVO bkvo) {
		return dao.bookMarkInsert(bkvo);
	}

	@Override
	public List<BookmarkVO> bookMarkCheck(String id) {
		return dao.bookMarkCheck(id);
	}

	@Override
	public int bookMarkDelete(BookmarkVO bkvo) {
		return dao.bookMarkDelete(bkvo);
	}
}
