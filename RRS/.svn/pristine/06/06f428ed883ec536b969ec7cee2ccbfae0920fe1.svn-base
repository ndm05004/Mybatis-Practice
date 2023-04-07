package rrs.admin.service;

import java.util.List;

import rrs.vo.MemberVO;
import rrs.vo.NoticeBoardVO;
import rrs.vo.RestautantVO;
import rrs.vo.RstDetailVO;

public interface IAdminService {
	//-------사업자 승인 페이지 ------------------
	
	/**
	 * 사업자 정보조회(승인대기)
	 * @return List<RestautantVO>
	 */
	public List<RestautantVO> waitApproval();
	
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
	public List<RstDetailVO> restaurantInfo();

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
	public List<MemberVO> memberInfo();
	
	
	/**
	 * 회원관리 페이지
	 * 클릭한 회원 자세하게 조회 
	 * @param rst_id
	 * @return
	 */
	public MemberVO memberDetail(String mem_id);
	
	
	// 멤버 블랙리스트 관리부분
	
	
	
	
	//---------- 공지사항 게시판
	
	/**
	 * 공지사항 게시판
	 * 게시판 전체 조회
	 * @return RestautantVO
	 */
	public List<NoticeBoardVO> noticeBoardInfo();
	
	
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
	
	
	// 공지사항 수정자리
	public int noticeboardUpdate(int nb_id);
	
	
}
