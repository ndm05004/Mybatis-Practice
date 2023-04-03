package member.dao;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import member.vo.MemberVO;



public class MemberDaoImpl implements IMemberDao {
	
	private static MemberDaoImpl memberDao;
	
	SqlSession session = null;
	
	private MemberDaoImpl() {
	}
	
	public static MemberDaoImpl getInstance() {
		if(memberDao == null) memberDao = new MemberDaoImpl();
		return memberDao;
	}

	
	
	@Override
	public int insertMember(MemberVO memVo) {
		
		int cnt = 0; // 반환값이 저장될 변수

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("member.insertMember", memVo);
		} finally {
			session.commit();
			session.close();	
		}

		return cnt;
	}

	
	@Override
	public int deleteMember(String memId) {
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();		
			cnt = session.delete("member.deleteMember", memId);
		}  finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	
	@Override
	public int updateMember(MemberVO memVo) {
		
		int cnt = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("member.updateMember", memVo);
		
		}  finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<MemberVO> getAllMember() {

		List<MemberVO> list = new ArrayList<>();

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			
			list=session.selectList("member.getAllMember");

		} finally {
			session.commit();
			
			session.close();
		}
		return list;
	}

	@Override
	public int getMemberCount(String memId) {

		int count = 0; // 반환값이 저장될 변수 선언

		try {
			
			session = MybatisSqlSessionFactory.getSqlSession();
			
			count=session.selectOne("member.getMemberCount", memId);
			
		}  finally {
			session.commit();
			
			session.close();			
		}
		return count;
	}

//	// Map의 정보 key값 : 수정할 컬럼명(filed), 수정할 데이터(data), 검색할회원ID(memId)
//	@Override
	public int updateMember2(Map<String, String> paramMap) {
		// TODO Auto-generated method stub

		int cnt = 0;

		try {

			session = MybatisSqlSessionFactory.getSqlSession();
			
			cnt=session.update("member.updateMember2", paramMap);
			
		} finally {

			session.close();			
		}

		return cnt;
	}

//	@Override
	public int updateMember3(Map<String, String> dataMap) {

		
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			
			cnt =session.update("member.updateMember2", dataMap);

		} finally {
			session.close();			
		}

		return cnt;
	}
}


