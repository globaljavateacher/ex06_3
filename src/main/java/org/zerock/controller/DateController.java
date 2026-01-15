package org.zerock.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.service.DateService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/date/*")
@AllArgsConstructor
public class DateController {
	
	private DateService dateService;
	
	@GetMapping("/now")
	@ResponseBody
	public Date now(Model model) {
		
		model.addAttribute("now", dateService.getNow());
		
//		return "now";
		return dateService.getNow();
		
	}
	
}
