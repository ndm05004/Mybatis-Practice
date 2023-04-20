package rrs.rstaurant.service;

import java.util.List;

import rrs.rstaurant.dao.IRstDao;
import rrs.rstaurant.dao.RstDaoImpl;
import rrs.vo.AnswerVO;
import rrs.vo.CategoryVO;
import rrs.vo.IqrVO;
import rrs.vo.MemberVO;
import rrs.vo.MenuVO;
import rrs.vo.ReservationDetailVO;
import rrs.vo.ReservationVO;
import rrs.vo.RestautantVO;
import rrs.vo.ReviewVO;
import rrs.vo.RstcmtVO;
import rrs.vo.RsttagVO;
import rrs.vo.RvrepotVO;
import rrs.vo.TagVO;

public class RstServiceImpl implements IRstService {
	private static RstServiceImpl instance;
	private IRstDao dao;

	private RstServiceImpl() {
		dao = RstDaoImpl.getInstance();
	}

	public static RstServiceImpl getInstance() {
		if (instance == null)
			instance = new RstServiceImpl();
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
		int i = dao.rstJoin(vo);
		dao.insertTableType(vo.getRst_id());
		return i;
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
	public List<ReviewVO> reviewAll(ReviewVO vo) {
		return dao.reviewAll(vo);
	}

	@Override
	public List<MenuVO> showMenu(String rstId) {
		return dao.showMenu(rstId);
	}

	@Override
	public int addMenu(MenuVO vo) {
		return dao.addMenu(vo);
	}

	@Override
	public MenuVO getMenuDetail(MenuVO vo) {
		return dao.getMenuDetail(vo);
	}

	@Override
	public int updateMenu(MenuVO vo) {
		return dao.updateMenu(vo);
	}

	@Override
	public int deleteMenu(MenuVO vo) {
		return dao.deleteMenu(vo);
	}

	@Override
	public int insertRstCmt(RstcmtVO vo) {
		return dao.insertRstCmt(vo);
	}

	@Override
	public List<RstcmtVO> showReply(int rvid) {
		return dao.showReply(rvid);
	}

	@Override
	public int reviewReport(RvrepotVO vo) {
		return dao.reviewReport(vo);
	}

	@Override
	public List<TagVO> getTag() {
		return dao.getTag();
	}

	@Override
	public int deleteCmt(int rvid) {
		return dao.deleteCmt(rvid);
	}

	@Override
	public int modifyCmt(RstcmtVO vo) {
		return dao.modifyCmt(vo);
	}

	@Override
	public List<IqrVO> rstQuestion(String rstid) {
		return dao.rstQuestion(rstid);
	}

	@Override
	public int deleteRstTag(String parameter) {
		return dao.deleteRstTag(parameter);
	}

	@Override
	public int insertRstTagList(RsttagVO rsttagVO) {
		return dao.insertRstTagList(rsttagVO);
	}
	
	@Override
	public MemberVO searchNick(String nick) {
		return dao.searchNick(nick);
	}

	@Override
	public int insertAnswer(AnswerVO vo) {
		return dao.insertAnswer(vo);
	}

	@Override
	public int blackListUpdate(String memid) {
		// TODO Auto-generated method stub
		return dao.blackListUpdate(memid);
	}

	@Override
	public int memberReport(String memid) {
		// TODO Auto-generated method stub
		return dao.memberReport(memid);
	}

	@Override
	public int rstReport(String memid, RvrepotVO vo) {
		return dao.blackListUpdate(memid) + dao.memberReport(memid) + dao.reviewReport(vo);
	}
	@Override
	public MemberVO idfromrv(int rvid) {
		return dao.idfromrv(rvid);
	}
}
