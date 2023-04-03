package kr.or.ddit.basic.json;

import java.util.List;

import lprod.vo.LprodVO;

public class LprodService {
	
	private static LprodService service;
	private LprodDao dao=null;
	
	private LprodService () {
		
		dao = LprodDao.getInstance();
		
	}
	
	
	
	public static LprodService getInstance() {
		if(service==null) service = new LprodService();
		return service;
	}
	
	public List<LprodVO> lProdListPrint() {
		return dao.lProdListPrint();
	}
	
}
