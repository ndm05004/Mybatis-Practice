package rrs.rstaurant.service;

import java.util.List;

import rrs.rstaurant.dao.IRstDao;
import rrs.rstaurant.dao.RstDaoImpl;
import rrs.vo.CategoryVO;
import rrs.vo.ReservationDetailVO;
import rrs.vo.ReservationVO;
import rrs.vo.RestautantVO;
import rrs.vo.ReviewVO;
import rrs.vo.TagVO;

public class RstServiceImpl implements IRstService{
	private static RstServiceImpl instance;
	private IRstDao dao;
	private RstServiceImpl() {
		dao = RstDaoImpl.getInstance();
	}
	
	public static RstServiceImpl getInstance() {
		if(instance ==null)instance = new RstServiceImpl();
		return instance;
	}
	
	@Override
	public List<CategoryVO> getCategory() {
		return dao.getCategory();
	}
	
	@Override
	public int checkId(String rstId) {
		return dao.checkId(rstId);
	}
	
	@Override
	public int rstJoin(RestautantVO vo) {
		return dao.rstJoin(vo);
	}
	
	
	@Override
	public RestautantVO selectRst(String rst_id) {
		return dao.selectRst(rst_id);
	}
	
	@Override
	public List<ReservationVO> getReservation(String rstId) {
		return dao.getReservation(rstId);
	}
	
	@Override
	public List<ReservationDetailVO> getReservDetail(String rsId) {
		return dao.getReservDetail(rsId);
	}

	@Override
	public int updateRst(RestautantVO vo) {
		return dao.updateRst(vo);
	}

	@Override
	public List<TagVO> selectTag(String rst_id) {
		return dao.selectTag(rst_id);
	}


	@Override
	public RestautantVO rstLogin(RestautantVO vo) {
		return dao.rstLogin(vo);
	}
	
	@Override
	public int rsCancel(String rsId) {
		return dao.rsCancel(rsId);
	}

	@Override
	public List<ReviewVO> reviewAll(String rstid) {
		return dao.reviewAll(rstid);
	}
}