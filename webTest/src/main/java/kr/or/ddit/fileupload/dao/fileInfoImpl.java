package kr.or.ddit.fileupload.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import kr.or.ddit.vo.FileinfoVO;

public class fileInfoImpl implements IfileinfoDao{
	
	private static IfileinfoDao dao;
	
	private fileInfoImpl() {
		
	}
	
	public static IfileinfoDao getInstance() {
		if(dao ==null) dao = new fileInfoImpl();
		return dao;
	}

	@Override
	public int insertFileinfo(FileinfoVO fileVo) {
		
		SqlSession session =null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("fileinfo.insertFileinfo", fileVo);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.commit();
			if(session!=null) session.close();
			
		}
		
		return cnt;
	}

	@Override
	public List<FileinfoVO> getAllFileinfo() {
		
		SqlSession session =null;
		List<FileinfoVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("fileinfo.getAllFileinfo");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(session==null) session.close();
		}
		
		return list;
	}

	@Override
	public FileinfoVO getFileinfo(int fileNo) {
		
		SqlSession session =null;
		FileinfoVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("fileinfo.getFileinfo",fileNo);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}
	
	
	
	
	

}
