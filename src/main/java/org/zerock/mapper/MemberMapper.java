package org.zerock.mapper;

import java.util.Map;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insertMember(Map memberMap);
	
	public void insertMemberAuth(Map memberMap);
	
}
