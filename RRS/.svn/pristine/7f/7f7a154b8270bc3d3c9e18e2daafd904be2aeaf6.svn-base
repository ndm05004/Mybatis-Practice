package rrs.admin.dao;

import java.util.List;
import java.util.Map;
import rrs.vo.CmtReportViewVO;
import rrs.vo.MemberVO;
import rrs.vo.NoticeBoardVO;
import rrs.vo.RestautantVO;
import rrs.vo.RstDetailVO;
import rrs.vo.RvReportViewVO;



public interface IAdminDao {
	//-------사업자 승인 페이지 ------------------
	
	/**
	 * 컬럼명을 넣어주면 totalCount를 찾아줌
	 * @param col
	 * @return
	 */
	int totalCount(Map<String, Object> params);
	
	/**
	 * 사업자 정보조회(승인대기)
	 * @return List<RestautantVO>
	 */
	public List<RestautantVO> waitApproval(Map<String, Object> map);
	
	/**
	 * 결재관리버튼(승인)
	 * @param res_id 레스토랑 아이디
	 * @return 성공1 실패0
	 */
	public int signupApproval(String res_id);
	
	
	
	/**
	 * 결재관리버튼(삭제)
	 * @param res_id 레스토랑 아이디
	 * @return 성공1 실패1
	 */
	public int signupDelete(String res_id);
		
	
	
	//--------- 회원관리----------------------
	
	/**
	 * 회원관리 페이지
	 * 사업자 정보 조회 전체
	 * @return RestautantVO
	 */
	public List<RstDetailVO> restaurantInfo(Map<String, Object> map);
	
	/** 관리자페이지 메인 사업자 정보 리스트 조회 */
	public List<RstDetailVO> restaurantInfo2();

	/**
	 * 회원관리 페이지
	 * 클릭한 사업자 자세하게 조회 
	 * @param rst_id
	 * @return
	 */
	public RstDetailVO restaurantDetail(String rst_id);
	
	/**
	 * 회원관리 페이지
	 * 회원 전체 정보 조회
	 * @return RestautantVO
	 */
	public List<MemberVO> memberInfo(Map<String, Object> map);
	
	
	/**
	 * 회원관리 페이지
	 * 클릭한 회원 자세하게 조회 
	 * @param rst_id
	 * @return
	 */
	public MemberVO memberDetail(String mem_id);
	
	
	// 댓글관리 부분
	/**
	 * 리뷰관리페이지 리스트 출력
	 * @return 리뷰 리스트 출력
	 */
	public List<CmtReportViewVO> cmtReportList();
	
	/**
	 * 리뷰관리 페이지 회원 ID로 조회후 출력
	 * @return
	 */
	public List<CmtReportViewVO> cmtReportDetail(String mem_id);
	
	
	// 리뷰관리 부분
	/**
	 * 리뷰관리페이지 리스트 출력
	 * @return 리뷰 리스트 출력
	 */
	public List<RvReportViewVO> rvreportList();
	
	/**
	 * 리뷰관리 페이지 회원 ID로 조회후 출력
	 * @return
	 */
	public List<RvReportViewVO> rvreportDetail(String mem_id);
	
	/**
	 * 신고관리 신고해제
	 * @return
	 */
	public int rnRelease(String mem_id);
	
	
	/**
	 * 블랙리스트 상세페이지 댓글신고 목록
	 * 삭제
	 * @param mem_id
	 * @return
	 */
	public int rnRelease2(int cmtr_id);

	
	/**
	 * 블랙리스트 상세페이지 리뷰신고 목록
	 * 삭제
	 * @param rvr_id
	 * 
	 */
	public int rvrRelease(int rvr_id);
	
	
	// 멤버 블랙리스트 관리부분
	/**
	 * 회원관리 페이지
	 * 회원 블랙리스트 전체 정보 조회
	 * @return MemberVO
	 */
	public List<MemberVO> blackListInfo(Map<String, Object> map);
	
	
	/**
	 * 블랙리스트 결재관리버튼(해제)
	 * @param mem_id 회원 아이디
	 * @return 성공1 실패0
	 */
	public int signupBlackListDel(String mem_id);	
	
	
	//---------- 공지사항 게시판
	
	/**
	 * 공지사항 게시판
	 * 게시판 전체 조회
	 * @return RestautantVO
	 */
	public List<NoticeBoardVO> noticeBoardInfo(Map<String, Object> map);
	
	
	/**
	 * 공지사항 게시판
	 * 클릭한 게시판 조회
	 * @return RestautantVO
	 */
	public NoticeBoardVO noticeBoardDetail(int nb_id);
	
	/**
	 * 공지사항 게시판
	 * 공지사항 입력
	 * @return 성공1 실패0
	 */
	public int noticeBoardWrite(NoticeBoardVO vo);
	
	
	
	/**
	 * 공지사항 게시판
	 * 공지사항 삭제
	 * @return 성공1 실패0
	 */
	public int noticeboardDelete(int nb_id);
	
	
	/**
	 *  공지사항 수정자리
	 * @param nb_id
	 * @return
	 */
	public int noticeboardUpdate(NoticeBoardVO vo);
	
	
	
	//메인페이지 
	
	/**
	 * 메인 페이지
	 * 승인대기 count 출력 
	 * @return 성공1 실패0
	 * 
	 */
	public int signCount();



}
