package kr.or.ddit.basic.session;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import member.vo.MemberVO;

public class MemberDao {
	
	private static MemberDao dao;
	
	private MemberDao() {
		
	}
	
	public static MemberDao getInstance() {
		if(dao==null) dao = new MemberDao();
		return dao;
	}
	
	public MemberVO getMember(MemberVO vo) {
		
		SqlSession session = null;
		
		MemberVO loginMemberVO = null;
		
		try {
			
			session = MybatisSqlSessionFactory.getSqlSession();
			
			loginMemberVO = session.selectOne("member.getMember", vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return loginMemberVO;
	}
	

}
