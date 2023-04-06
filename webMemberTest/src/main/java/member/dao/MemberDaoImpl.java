package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import member.vo.MemberVo;

public class MemberDaoImpl implements IMemberDao {
	
	private static MemberDaoImpl dao;
	
	private MemberDaoImpl() {
		
	}
	
	public static MemberDaoImpl getInstance() {
		if(dao==null) dao = new MemberDaoImpl();
		return dao;
	}
	
	@Override
	public List<MemberVo> selectAll() {
		
		List<MemberVo> volist =null;
		
		SqlSession session = null;
		
		try {
			
			session = MybatisSqlSessionFactory.getSqlSession();
			
			volist = session.selectList("member.selectAll");
			
		} finally {
			session.commit();
			session.close();
		}
		
		return volist;
	}

	@Override
	public MemberVo selectDetail(String id) {
		
		MemberVo vo =null;
		
		SqlSession session = null;
		
		try {
			
			session = MybatisSqlSessionFactory.getSqlSession();
			

			vo = session.selectOne("member.selectDetail", id);
			
		} finally {
			session.commit();
			session.close();
		}
		
		return vo;
	}


	@Override
	public int insertMember(MemberVo vo) {

		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("member.insertMember", vo);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	
	@Override
	public int deleteMember(String id) {
		
		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("member.deleteMember", id);
			
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public String idcheck(String id) {
		
		SqlSession session = null;
		String mem_id=null;
		try {
			
			session = MybatisSqlSessionFactory.getSqlSession();
			

			mem_id = session.selectOne("member.idcheck", id);
			
		} finally {
			session.commit();
			session.close();
		}
		
		return mem_id;
	}

	@Override
	public int updateMember(MemberVo vo) {
		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("member.updatemember", vo);
			
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
	
	
	

}