package org.zerock.controller;

import java.util.Map;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
//	MemberController(MemberService memberService){
//		this.memberService = memberService;
//	}
	
	@GetMapping("/join/form")
	public String joinForm() {
		return "member/join_form";
	}
	
	@PostMapping("/join/regist")
	@PreAuthorize("permitAll()")
	public String regist(@RequestParam Map memberMap) {
		memberService.regist(memberMap);
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	

}
