package rrs.member.service;

import java.util.List;

import rrs.vo.CmtVO;
import rrs.vo.ReservationVO;
import rrs.vo.ReviewVO;
import rrs.vo.RsMenuVO;

public interface IMemberService {
	
	// 예약 정보 입력
	public int insertrsv(ReservationVO vo);
	
	// 예약 메뉴 입력
	public int insertrsvmenu(RsMenuVO vo);
	
	// 수용인원 빼기
	
	// 리뷰 작성
	public int insertReview(ReviewVO vo);
	
	// 리뷰 조회
	public List<ReviewVO> selectRvList(String memId);
	
	// 리뷰 수정
	public int updateReview(ReviewVO vo);
	
	// 리뷰 삭제
	public int deleteReview(int rvNum);
	
	// 리뷰 신고
	
	// 댓글 작성
	public int insertCmt(CmtVO vo);
	
	// 댓글 조회
	public List<CmtVO> selectCmtList(String memId);
	
	// 댓글 수정
	public int updateCmt(CmtVO vo);
	
	// 댓글 삭제
	public int deleteCmt(int cmtNum);
	
	// 댓글 신고
	
	
	
}
