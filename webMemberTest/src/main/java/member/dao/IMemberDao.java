package member.dao;

import java.util.List;

import member.vo.MemberVo;

public interface IMemberDao {
	
	public List<MemberVo> selectAll();
	
	public MemberVo selectDetail(String id);
	
	public int insertMember(MemberVo vo);
	
	public int deleteMember(String id);
	
	public String idcheck(String id);
}
