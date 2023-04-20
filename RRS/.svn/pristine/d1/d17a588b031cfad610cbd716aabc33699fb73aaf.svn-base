package rrs.rstaurant.service;

import java.util.List;

import rrs.vo.AnswerVO;
import rrs.vo.CategoryVO;
import rrs.vo.IqrVO;
import rrs.vo.MemberVO;
import rrs.vo.MenuVO;
import rrs.vo.ReservationDetailVO;
import rrs.vo.ReservationVO;
import rrs.vo.RestautantVO;
import rrs.vo.ReviewVO;
import rrs.vo.RstcmtVO;
import rrs.vo.RsttagVO;
import rrs.vo.RvrepotVO;
import rrs.vo.TagVO;

public interface IRstService {

	/**
	 * 카테고리 끌고오는 매소드
	 * 
	 * @return
	 */
	public List<CategoryVO> getCategory();

	/**
	 * 아이디 유효성 검사
	 * 
	 * @param rstId
	 * @return
	 */
	public int checkId(String rstId);

	/**
	 * 회원가입 매서드
	 * 
	 * @param vo
	 * @return
	 */
	public int rstJoin(RestautantVO vo);

	/**
	 * 식당 정보 끌고오기
	 * 
	 * @param rst_id
	 * @return
	 */
	public RestautantVO selectRst(String rst_id);

	/**
	 * 내 식당 예약 정보 끌고오기
	 * 
	 * @param rstId
	 */
	public List<ReservationVO> getReservation(String rstId);

	/**
	 * 해당 예약 버튼을 눌럿을때 상세 예약 정보를 끌고온다
	 * 
	 * @param rsId
	 * @return
	 */
	public List<ReservationDetailVO> getReservDetail(String rsId);

	/**
	 * 식당 사업자 정보업데이트
	 * 
	 * @param vo
	 * @return
	 */
	public int updateRst(RestautantVO vo);

	/**
	 * 식당 카테고리 태그
	 * 
	 * @param rst_id
	 * @return
	 */
	public List<TagVO> selectTag(String rst_id);

	/**
	 * 로그인 쿼리
	 * 
	 * @param vo
	 * @return
	 */
	public RestautantVO rstLogin(RestautantVO vo);

	/**
	 * 예약 취소 하는거
	 * 
	 * @param rsId
	 */
	public int rsCancel(String rsId);

	/**
	 * 사업장에 달린 리뷰를 불러오는 메서드
	 * 
	 * @param rstid
	 * @return
	 */
	public List<ReviewVO> reviewAll(ReviewVO vo);

	/**
	 * 메뉴 전체 셀렉트
	 * 
	 * @param rstId
	 * @return
	 */
	public List<MenuVO> showMenu(String rstId);

	/**
	 * 매뉴 추가 매서드
	 * 
	 * @param vo
	 * @return
	 */
	public int addMenu(MenuVO vo);

	/**
	 * 해당 식당의 해당 매뉴 상세정보 보여주기
	 * 
	 * @param vo
	 * @return
	 */
	public MenuVO getMenuDetail(MenuVO vo);

	/**
	 * 메뉴 변경하는 매서드
	 * 
	 * @param vo
	 * @return
	 */
	public int updateMenu(MenuVO vo);

	/**
	 * 메뉴 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteMenu(MenuVO vo);

	/**
	 * 리뷰에 사장이 댓글다는거
	 * 
	 * @param vo
	 * @return
	 */
	public int insertRstCmt(RstcmtVO vo);

	/**
	 * 리뷰에 달린 사업자 댓글 보여주기
	 * 
	 * @param rvid
	 * @return
	 */
	public List<RstcmtVO> showReply(int rvid);

	/**
	 * 사업자가 리뷰신고하기
	 * 
	 * @param vo
	 */
	public int reviewReport(RvrepotVO vo);

	/**
	 * 사업자 mypage내에서 카테고리 선택하기
	 */
	public List<TagVO> getTag();

	/**
	 * 사업자 리뷰관리에서 사장님 댓글 삭제
	 * 
	 * @param rvid
	 * @return
	 */
	public int deleteCmt(int rvid);

	/**
	 * 사업자 리뷰관리 사장님댓글수정
	 * 
	 * @param vo
	 * @return
	 */
	public int modifyCmt(RstcmtVO vo);

	/**
	 * rst문의 리스트 보기
	 * 
	 * @param rstid
	 * @return
	 */
	public List<IqrVO> rstQuestion(String rstid);

	/**
	 * 태그 업데이트 1
	 * 
	 * @param parameter
	 * @return
	 */
	public int deleteRstTag(String parameter);

	/**
	 * 태그 업데이트 2
	 * 
	 * @param tagId
	 * @return
	 */
	public int insertRstTagList(RsttagVO rsttagVO);

	/**
	 * 닉네임으로 메일, 아이디 찾기
	 * 
	 * @param nick
	 * @return
	 */
	public MemberVO searchNick(String nick);

	/**
	 * 문의 답변하기
	 */
	public int insertAnswer(AnswerVO vo);
	
	
	/**
	 * 블랙리스트 업데이트용
	 */
	public int blackListUpdate(String memid);
	
	/**
	 * 회원 신고시 rn증가용
	 */
	public int memberReport(String memid);
	
	/**
	 * 블랙리스트 업데이트, 회원신고시 rn증가, 회원신고
	 */
	public int rstReport(String memid, RvrepotVO vo);
	/**
	 * 리뷰아이디로 회원아이디 찾기
	 * @param rvid
	 * @return
	 */
	public MemberVO idfromrv(int rvid);
}
