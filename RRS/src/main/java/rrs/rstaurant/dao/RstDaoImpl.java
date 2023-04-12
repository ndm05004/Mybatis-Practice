package rrs.rstaurant.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import rrs.util.MybatisSqlSessionFactory;
import rrs.vo.CategoryVO;
import rrs.vo.ReservationDetailVO;
import rrs.vo.ReservationVO;
import rrs.vo.RestautantVO;
import rrs.vo.ReviewVO;
import rrs.vo.TagVO;

public class RstDaoImpl implements IRstDao {
	private static RstDaoImpl instance;

	private RstDaoImpl() {
	}

	public static RstDaoImpl getInstance() {
		if (instance == null)
			instance = new RstDaoImpl();
		return instance;
	}

	@Override
	public RestautantVO selectRst(String rst_id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		RestautantVO vo = null;

		try {
			vo = session.selectOne("restaurant.selectRst", rst_id);
		} finally {
			session.close();
		}
		return vo;
	}

	// 카테고리 끝
	@Override
	public List<CategoryVO> getCategory() {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<CategoryVO> list = null;
		try {
			list = session.selectList("restaurant.getCategory");
		} catch (Exception e) {
			System.out.println("카테고리 끌고 오기 오류" + e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int checkId(String rstId) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.selectOne("restaurant.checkId", rstId);
		} catch (Exception e) {
			System.out.println("아이디 유효성 검사 오류" + e.getMessage());
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int rstJoin(RestautantVO vo) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.insert("restaurant.rstJoin", vo);
		} catch (Exception e) {
			System.out.println("아이디 : " + vo.getRst_id());
			System.out.println("비밀번호 : " + vo.getRst_pass());
			System.out.println("이름 : " + vo.getRst_name());
			System.out.println("사업자번호 : " + vo.getBs_num());
			System.out.println("카테고리 : " + vo.getCtg_id());
			System.out.println("전화번호 : " + vo.getRst_tel());
			System.out.println("이메일 : " + vo.getRst_mail());
			System.out.println("주소 : " + vo.getRst_addr());
			System.out.println("사진 : " + vo.getRst_photo());
			System.out.println("회원가입 오류" + e.getMessage());
		} finally {
			session.close();
		}
		return res;
	}
	
	
	@Override
	public List<ReservationVO> getReservation(String rstId) {
		List<ReservationVO> list  =null;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			list = session.selectList("restaurant.getReservation", rstId);
		} catch (Exception e) {
			if(list != null) {
				System.out.println("예약 번호 : "+list.get(0).getRs_id());
				System.out.println("예약 시간 : "+list.get(0).getRs_datetime());
				System.out.println("예약 한 사람 : "+list.get(0).getMem_id());
			}
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<ReservationDetailVO> getReservDetail(String rsId) {
		List<ReservationDetailVO> list  =null;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			list = session.selectList("restaurant.getReservDetail", rsId);
		} catch (Exception e) {
			if(list != null) {
				System.out.println("예약 번호 : "+list.get(0).getRs_id());
				System.out.println("예약 시간 : "+list.get(0).getRs_datetime());
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int updateRst(RestautantVO vo) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.update("restaurant.updateRst",vo);
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<TagVO> selectTag(String rst_id) {
		List<TagVO> list  = null;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			list = session.selectList("restaurant.selectTag",rst_id);
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public RestautantVO rstLogin(RestautantVO vo) {
		SqlSession session = null;
		RestautantVO rstVo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			rstVo = session.selectOne("restaurant.rstLogin",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return rstVo;
	}
	
	@Override
	public int rsCancel(String rsId) {
		int res = 0;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			res = session.update("restaurant.rsCancel",rsId);
		}finally {
			session.close();
		}
		return res;
	}

	@Override
	public  List<ReviewVO> reviewAll(String rstid) {
		List<ReviewVO> list = null;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		try {
			list = session.selectList("restaurant.reviewAll",rstid);
		} finally {
			session.close();
		}
		return list;
	}

}