package org.zerock.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Transactional
	@Override
	public void regist(Map memberMap) {
		memberMap.put("userpw", bcryptPasswordEncoder.encode((String)memberMap.get("userpw")));
		memberMapper.insertMember(memberMap);
		memberMapper.insertMemberAuth(memberMap);
	}

}
