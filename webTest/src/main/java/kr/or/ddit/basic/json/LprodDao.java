package kr.or.ddit.basic.json;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import lprod.vo.LprodVO;

public class LprodDao {
	
	private static LprodDao dao;
	
	private LprodDao() {
		
	}
	
	public static LprodDao getInstance() {
		if(dao==null) dao= new LprodDao();
		return dao;
	}
	
	public List<LprodVO> lProdListPrint() {
		
		List<LprodVO> list = null;
		SqlSession session =null;
		
		try {
			
			session = MybatisSqlSessionFactory.getSqlSession();
			
			list = session.selectList("lprod.lProdListPrint");
			
		} finally {
			// TODO: handle finally clause
		}
		
		
		
		return list;
		
	}

}
