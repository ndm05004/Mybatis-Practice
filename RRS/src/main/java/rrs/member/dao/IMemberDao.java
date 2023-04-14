package rrs.member.dao;

import java.util.List;

import rrs.vo.CmtVO;
import rrs.vo.IqrVO;
import rrs.vo.MemberVO;
import rrs.vo.ReservationDetailVO;
import rrs.vo.ReservationVO;
import rrs.vo.RestautantVO;
import rrs.vo.ReviewVO;
import rrs.vo.RsMenuVO;
import rrs.vo.SearchVO;

public interface IMemberDao {
	
	// 회원 아이디 찾기
	public String searchId(MemberVO vo);
	
	// 회원 비밀번호 찾기 존재하는 계정인지 확인
	public String searchPass(MemberVO vo);
		
	// 비밀번호 재설정
	public int newPassSet(MemberVO vo);
	
	// 회원 로그인 ID,PASS 일치여부 확인
	public MemberVO loginCheck(MemberVO vo);
	
	// 회원 정보 수정
	public int updateMember(MemberVO vo);
	
	// 회원 탈퇴
	public int deleteMember(String id);
	
	// 예약 정보 조회
	public List<ReservationDetailVO> selectRsvList(String id);
	
	// 예약 정보 입력
	public int insertrsv(ReservationVO vo);
		
	// 예약 메뉴 입력
	public int insertrsvmenu(RsMenuVO vo);
	
	// 예약 메뉴 조회
	public List<RsMenuVO> selectRsMenuList(String rs_id);
		
	// 수용인원 빼기
	
	// 리뷰 작성
	public int insertReview(ReviewVO vo);
	
	// 리뷰 조회
	public List<ReviewVO> selectRvList(String memId);
	
	// 리뷰 상세 조회
	public ReviewVO selectReview(int rvNum);
	
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
	
	// 회원 ID 확인
	public int memberIdCheck(String memId);
	
	// 회원 가입
	public int insertMember(MemberVO memVo);
	
	//식당 검색
	public List<SearchVO> searchRst(String content);
	
	//문의 글 작성하기
	public int boardInsert(IqrVO vo);
	
	//식당아이디로 정보 가져오기
	public RestautantVO findRst(String id);
	
	//아이디별 인력한 문의 내역 가져오기
	public List<IqrVO> selectIqrList(String id);
	
	//선택한 문의글 보여주기
	public IqrVO iqrInfoView(int id);

}
