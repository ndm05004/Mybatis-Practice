package rrs.admin.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import rrs.util.MybatisSqlSessionFactory;
import rrs.vo.CmtReportViewVO;
import rrs.vo.MemberVO;
import rrs.vo.NoticeBoardVO;
import rrs.vo.RestautantVO;
import rrs.vo.RstDetailVO;
import rrs.vo.RvReportViewVO;


public class AdminDaoImpl implements IAdminDao{
	
	private static AdminDaoImpl dao;
	
	private AdminDaoImpl() {
		
	}
	
	public static AdminDaoImpl getInstance() {
		if(dao==null) dao = new AdminDaoImpl();
		return dao;
	}
	
	
	//-------사업자 승인 페이지 ------------------ 
	
	// 사업자 정보조회(승인대기)
	@Override
	public List<RestautantVO> waitApproval(Map<String, Object> map) {
		
		List<RestautantVO> restList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			restList = session.selectList("admin.waitApproval", map);
			
		} finally {
			session.close();
		}
		
		return restList;
	}
	
	
	@Override
	public int totalCount(Map<String, Object> params) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		
		int cnt=0;
		
		try {
			
			cnt = session.selectOne("admin.totalCount", params);
			
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
	
	
	// 결재관리버튼(승인)
	@Override
	public int signupApproval(String res_id) {
		
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("admin.signupApproval",res_id);
			
		} finally {
			session.close();		
		}		
		
		return cnt;
	}

	// 결재관리버튼(삭제)
	@Override
	public int signupDelete(String res_id) {
		
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("admin.signupDelete", res_id);
			
		} finally {
			session.close();
		}		
		
		return cnt;
	}
	
	
	
	//--------- 회원관리----------------------
	// 사업자 정보 조회 (관리자)
	@Override
	public List<RstDetailVO> restaurantInfo(Map<String, Object> map) {

		List<RstDetailVO> restList = null;
				
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			restList = session.selectList("admin.restaurantInfo", map);
						
		} finally {
			session.close();
		}
		
		return restList;
	}
	
	// 관리자페이지 메인 사업자 정보 조회 (관리자)
	@Override
	public List<RstDetailVO> restaurantInfo2() {
		List<RstDetailVO> restList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			restList = session.selectList("admin.restaurantInfo2");
		} finally {
			session.close();
		}
		return restList;
	}


	// 사업자 상세 조회
	@Override
	public RstDetailVO restaurantDetail(String rst_id) {
		
		RstDetailVO vo = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("admin.restaurantDetail",rst_id);
			
		} finally {
			session.close();
		}
		
		return vo;
	}

	// 멤버 조회
	@Override
	public List<MemberVO> memberInfo(Map<String, Object> map) {
		
		List<MemberVO> memList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			memList = session.selectList("admin.memberInfo", map);
			
		} finally {
			session.close();
		}
		
		return memList;
	}


	
	// 멤버 상세조회
	@Override
	public MemberVO memberDetail(String mem_id) {
		
		MemberVO vo = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("admin.memberDetail", mem_id);
			
		} finally {
			session.close();
		}
		
		return vo;
	}

	
	
	
	
	
	
	// 멤버 블랙리스트 관리부분
	
	   //블랙리스트 조회
	   @Override
	   public List<MemberVO> blackListInfo(Map<String, Object> map) {
	      List<MemberVO> blackList = null;
	      
	      SqlSession session = null;
	      
	      try {
	         session = MybatisSqlSessionFactory.getSqlSession();
	         blackList = session.selectList("admin.blackListInfo", map);
	      } finally {
	         session.close();
	      }
	      
	      return blackList;
	   }
	   
	   
	   //블랙리스트 해제
		@Override
		public int signupBlackListDel(String mem_id) {
			
			SqlSession session = null;
			int cnt = 0;
			
			try {
				session = MybatisSqlSessionFactory.getSqlSession();
				cnt = session.update("admin.signupBlackListDel",mem_id);
				System.out.println(cnt);
			} finally {
				session.close();
			} 
		
			
			return cnt;
		}


	
	
	//---------- 공지사항 게시판
	
	// 공지사항 전체 조회
	@Override
	public List<NoticeBoardVO> noticeBoardInfo(Map<String, Object> map) {
		
		List<NoticeBoardVO> nbBoardList =null;
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			nbBoardList = session.selectList("admin.noticeBoardInfo", map);
			
		} finally {
			session.close();
		}
		
		return nbBoardList;
	}
	

	//선택한 공지사항 조회
	@Override
	public NoticeBoardVO noticeBoardDetail(int nb_id) {
		
		NoticeBoardVO vo =null;
		SqlSession session = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("admin.noticeBoardDetail", nb_id);				
		} finally {
			session.close();
		}
		return vo;
	}
	
	
	//공지사항 입력
	@Override
	public int noticeBoardWrite(NoticeBoardVO vo) {
		
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("admin.noticeBoardWrite", vo);
			
		} finally {
			session.close();
		}		
		
		return cnt;
	}
	
	// 공지사항 삭제
	@Override
	public int noticeboardDelete(int nb_id) {
		
		SqlSession session = null;
		int cnt =0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("admin.noticeboardDelete", nb_id);
			
		} finally {
			session.close();
		}		
		
		return cnt;
	}

	@Override
	public int noticeboardUpdate(NoticeBoardVO vo) {

		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("admin.noticeboardUpdate",vo);
			
		} finally {
			session.close();		
		}		
		
		return cnt;
	}

	
	// 리뷰관리 페이지 부분
	
	//댓글 출력
	@Override
	public List<CmtReportViewVO> cmtReportList() {
		
		List<CmtReportViewVO> cmtReportList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cmtReportList = session.selectList("admin.cmtReportList");
			
		} finally {
			session.close();
		}
		
		return cmtReportList;
	}
	
	//리뷰 출력
	@Override
	public List<RvReportViewVO> rvreportList() {
		
		List<RvReportViewVO> rvReportList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			rvReportList = session.selectList("admin.rvreportList");
			
		} finally {
			session.close();
		}
		
		return rvReportList;
	}

	
	// 공지사항 수정자리
	
	
	


	//---------- 메인 페이지
	
	
	//승인대기 count 출력
	@Override
	public int signCount() {
		
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.signCount");
		} finally {
			session.close();
		}
		
		return cnt;
	}

	
	/**
	 * 리뷰관리 페이지 회원 ID로 조회후 출력
	 * @return
	 */	
	@Override
	public List<CmtReportViewVO> cmtReportDetail(String mem_id) {
		
		List<CmtReportViewVO> cmtReport = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cmtReport = session.selectList("admin.cmtReportDetail", mem_id);
		} finally {
			session.close();
		}
		
		return cmtReport;
	}
			
	/**
	 * 리뷰관리 페이지 회원 ID로 조회후 출력
	 * @return
	 */
	@Override
	public List<RvReportViewVO> rvreportDetail(String mem_id) {
		
		List<RvReportViewVO> rvReport = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			rvReport = session.selectList("admin.rvreportDetail", mem_id);
			
		} finally {
			session.close();
		}
		
		return rvReport;
	}
		
	
	/**
	 * 신고관리 신고해제
	 * @return
	 */
	
	//블랙리스트 댓글신고 삭제
	@Override
	public int rnRelease(String mem_id) {
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("admin.rnRelease", mem_id);
		} finally {
			session.close();		
		}		
		return cnt;
	}
	
	//블랙리스트 댓글신고 삭제
	@Override
	public int rnRelease2(int cmtr_id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("admin.rnRelease2",cmtr_id);
		} finally {
			session.close();
		}
		return cnt;
	}
	
	//블랙리스트 리뷰신고 삭제
	@Override
	public int rvrRelease(int rvr_id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("admin.rvrRelease",rvr_id);
		} finally {
			session.close();
		}
		return cnt;
	}

}
