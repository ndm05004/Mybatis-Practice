package member.service;

import java.util.List;
import java.util.Map;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.MemberVO;



public class MemberServiceImpl implements IMemberService {
	
	private static MemberServiceImpl memberServiceImpl;
	
	
	// 일을 시킬 DAO객체 변수 선언
	private IMemberDao dao;
	
	// 생성자
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberServiceImpl getInstance() {
		if(memberServiceImpl == null) memberServiceImpl = new MemberServiceImpl();
		return memberServiceImpl;
	}
	
	
	@Override
	public int insertMember(MemberVO memVo) {
		return  dao.insertMember(memVo);
	}

	@Override
	public int deleteMember(String memId) {
		
		return dao.deleteMember(memId);
	}

	@Override
	public int updateMember(MemberVO memVo) {
		
		return dao.updateMember(memVo);
	}

	@Override
	public List<MemberVO> getAllMember() {
		
		return dao.getAllMember();
	}

	@Override
	public int getMemberCount(String memId) {

		return dao.getMemberCount(memId);
	}



	public int updateMember2(Map<String, String> paramMap) {
		return dao.updateMember2(paramMap);
	}
	

	public int updateMember3(Map<String, String> paramMap) {
		return dao.updateMember3(paramMap);
	}

}
