package member.service;

import java.util.List;

import member.vo.MemberVo;

public interface IMemberService {
	public List<MemberVo> selectAll();
	
	public MemberVo selectDetail(String id);
	
	public int insertMember(MemberVo vo);
	
	public int deleteMember(String id);
}
