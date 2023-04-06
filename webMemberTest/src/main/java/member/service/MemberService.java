package member.service;

import java.util.List;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.MemberVo;

public class MemberService implements IMemberService{

	private IMemberDao dao;
	private static MemberService service;
	
	private MemberService() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberService getInstance() {
		if(service==null) service = new MemberService();
		return service;
	}
	
	@Override
	public List<MemberVo> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public MemberVo selectDetail(String id) {
		// TODO Auto-generated method stub
		return dao.selectDetail(id);
	}

	@Override
	public int insertMember(MemberVo vo) {
		// TODO Auto-generated method stub
		return dao.insertMember(vo);
	}

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return dao.deleteMember(id);
	}

	@Override
	public String idcheck(String id) {
		// TODO Auto-generated method stub
		return dao.idcheck(id);
	}
	
	

}
