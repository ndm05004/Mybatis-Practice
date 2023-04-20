package rrs.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import rrs.admin.dao.AdminDaoImpl;
import rrs.admin.dao.IAdminDao;
import rrs.vo.CmtReportViewVO;
import rrs.vo.MemberVO;
import rrs.vo.NoticeBoardVO;
import rrs.vo.PageVO;
import rrs.vo.RestautantVO;
import rrs.vo.RstDetailVO;
import rrs.vo.RvReportViewVO;


public class AdminServiceImpl implements IAdminService {

	private static AdminServiceImpl service;
	private IAdminDao dao;
	
	private AdminServiceImpl() {
		dao = AdminDaoImpl.getInstance();
	}
	
	public static AdminServiceImpl getInstance() {
		if(service==null) service = new AdminServiceImpl();
		return service;
	}
	
	
	//-------사업자 승인 페이지 ------------------

	@Override
	public List<RestautantVO> waitApproval(Map<String, Object> map) {
		return dao.waitApproval(map);
	}
	
	@Override
	public int totalCount(Map<String, Object> params) {
		return dao.totalCount(params);
	}
	
	

	@Override
	public int signupApproval(String res_id) {
		return dao.signupApproval(res_id);
	}

	@Override
	public int signupDelete(String res_id) {
		return dao.signupDelete(res_id);
	}

	
	
	
	//--------- 회원관리----------------------
	@Override
	public List<RstDetailVO> restaurantInfo(Map<String, Object> map) {
		return dao.restaurantInfo(map) ;
	}

	//관리자페이지 메인 사업자 리스트 조회
	@Override
	public List<RstDetailVO> restaurantInfo2() {
		return dao.restaurantInfo2();
	}
	
	
	@Override
	public RstDetailVO restaurantDetail(String rst_id) {
		return dao.restaurantDetail(rst_id);
	}

	@Override
	public List<MemberVO> memberInfo(Map<String, Object> map) {
		return dao.memberInfo(map);
	}

	@Override
	public MemberVO memberDetail(String mem_id) {
		return dao.memberDetail(mem_id);
	}

	
	
	// 멤버 블랙리스트 관리부분
	
	@Override
	public List<MemberVO> blackListInfo(Map<String, Object> map) {
		return dao.blackListInfo(map);
	}

	@Override
	public int signupBlackListDel(String mem_id) {
		return dao.signupBlackListDel(mem_id);
		
	}

	
	
	//---------- 공지사항 게시판
	@Override
	public List<NoticeBoardVO> noticeBoardInfo(Map<String, Object> map) {
		return dao.noticeBoardInfo(map);
	}

	@Override
	public NoticeBoardVO noticeBoardDetail(int nb_id) {
		return dao.noticeBoardDetail(nb_id);
	}

	public int noticeBoardWrite(NoticeBoardVO vo) {
		return dao.noticeBoardWrite(vo);
	}

	@Override
	public int noticeboardDelete(int nb_id) {
		return dao.noticeboardDelete(nb_id);
	}

	@Override
	public int noticeboardUpdate(NoticeBoardVO vo) {
		return dao.noticeboardUpdate(vo);
	}

	
	//--------리뷰 신고 비분
	@Override
	public List<CmtReportViewVO> cmtReportList() {
		// TODO Auto-generated method stub
		return dao.cmtReportList();
	}

	@Override
	public List<RvReportViewVO> rvreportList() {
		// TODO Auto-generated method stub
		return dao.rvreportList();
	}
	
	public Map<String, Object> reportList() {
		
		List<CmtReportViewVO> cmt = cmtReportList();
		List<RvReportViewVO> rv = rvreportList();
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("cmt", cmt);
		result.put("rv", rv);
		
		return result;
	}

	//--------메인 페이지 카운트
	@Override
	public int signCount() {
		// TODO Auto-generated method stub
		return dao.signCount();
	}

	@Override
	public List<CmtReportViewVO> cmtReportDetail(String mem_id) {
		// TODO Auto-generated method stub
		return dao.cmtReportDetail(mem_id);
	}

	@Override
	public List<RvReportViewVO> rvreportDetail(String mem_id) {
		// TODO Auto-generated method stub
		return dao.rvreportDetail(mem_id);
	}

	/**
	 * 업데이트
	 */
	@Override
	public int rnRelease(String mem_id) {
		
		return dao.rnRelease(mem_id);
	}
	
	/**
	 * 블랙리스트 상세페이지 댓글신고 목록
	 * 삭제
	 * @param mem_id
	 * @return
	 */
	public int rnRelease2(int cmtr_id) {
		
		return dao.rnRelease2(cmtr_id);
	}
	
	/**
	 * 블랙리스트 상세페이지 댓글신고 목록
	 * 한번에
	 * @param mem_id
	 */
	public int rnRelease3(String mem_id, int cmtr_id) {
		
		int cnt1= rnRelease(mem_id);
		int cnt2= rnRelease2(cmtr_id);
		
		return cnt1+ cnt2;
	}
	
	
	/** 
	 * 블랙리스트 상세페이지 리뷰신고 목록
	 * 삭제
	 * @param rvr_id
	 */
	@Override
	public int rvrRelease(int rvr_id) {

		return dao.rvrRelease(rvr_id);
	}

	/**
	 * 블랙리스트 상세페이지 리뷰신고 목록
	 * 한번에
	 * @param mem_id
	 */
	public int rvrRelease2(String mem_id, int rvr_id) {
		
		int cnt1= rnRelease(mem_id);
		int cnt2= rvrRelease(rvr_id);
		
		return cnt1+ cnt2;
	}
	
	//메인페이지 
	
		/**
		 * 메인 페이지
		 * 승인대기 count 출력 
		 * @return 성공1 실패0
		 * 
		 */


	

@Override
	public PageVO pageInfo(int page, Map<String, Object> params) {
		
		// 전체글갯수 구하기
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);

		int count = this.totalCount(params);

		
		// 전체 페이지 수 구하기
		int totalPage = (int)Math.ceil((double)count / PageVO.getPerList());
		
		//start, end구하기
		int start = (page -1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end > count) {
			end = count;
		}

		// 시작페이지, 끝페이지
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage -1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}

		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}


}
