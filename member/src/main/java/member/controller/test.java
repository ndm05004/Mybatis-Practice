package member.controller;

import member.service.MemberService;
import member.vo.MemberVo;

public class test {

	public static void main(String[] args) {

		MemberService service = MemberService.getInstance();
		
		String aa = "aa";
		
		MemberVo vo= service.selectDetail(aa);
		
		System.out.println(vo);
	}

}
