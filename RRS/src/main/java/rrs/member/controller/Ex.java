package rrs.member.controller;

import java.util.List;

import rrs.member.service.IMemberService;
import rrs.member.service.MemberServiceImpl;
import rrs.vo.ReviewVO;

public class Ex {
	public static void main(String[] args) {
		IMemberService service = MemberServiceImpl.getInstance();
		
		ReviewVO vo = new ReviewVO();
		String id = "d001";
		
		List<ReviewVO> selectRvList = service.selectRvList(id);
		
		System.out.println(selectRvList.get(0).getRv_content()); 
	}
}
