package rrs.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rrs.util.MybatisSqlSessionFactory;
import rrs.vo.MemberVO;
import rrs.vo.NoticeBoardVO;
import rrs.vo.RestautantVO;
import rrs.vo.RstDetailVO;



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
	public List<RestautantVO> waitApproval() {
		
		List<RestautantVO> restList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			restList = session.selectList("admin.waitApproval");
			
		} finally {
			session.commit();
			session.close();
		}
		
		return restList;
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
			session.commit();
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
			session.commit();
			session.close();
		}		
		
		return cnt;
	}
	
	
	
	//--------- 회원관리----------------------
	// 사업자 정보 조회 (관리자)
	@Override
	public List<RstDetailVO> restaurantInfo() {

		List<RstDetailVO> restList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			restList = session.selectList("admin.restaurantInfo");
			
		} finally {
			session.commit();
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
			session.commit();
			session.close();
		}
		
		return vo;
	}

	// 멤버 조회
	@Override
	public List<MemberVO> memberInfo() {
		
		List<MemberVO> memList = null;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			memList = session.selectList("admin.memberInfo");
			
		} finally {
			session.commit();
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
			session.commit();
			session.close();
		}
		
		return vo;
	}

	
	
	
	
	
	// 멤버 블랙리스트 관리부분
	
	
	
	
	//---------- 공지사항 게시판
	
	// 공지사항 전체 조회
	@Override
	public List<NoticeBoardVO> noticeBoardInfo() {
		
		List<NoticeBoardVO> nbBoardList =null;
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			nbBoardList = session.selectList("admin.noticeBoardInfo");
			
		} finally {
			session.commit();
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
			vo = session.selectOne("admin.noticeBoardDetail");				
		} finally {
			session.commit();
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
			session.commit();
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
			cnt = session.delete("signupDelete", nb_id);
			
		} finally {
			session.commit();
			session.close();
		}		
		
		return cnt;
	}

	@Override
	public int noticeboardUpdate(int nb_id) {

		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("admin.noticeboardUpdate",nb_id);
			
		} finally {
			session.commit();
			session.close();		
		}		
		
		return cnt;
	}
	
	// 공지사항 수정자리
	
}