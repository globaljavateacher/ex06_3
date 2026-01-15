package org.zerock.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/like/")
@RestController
public class LikeRestController {
	
	@Autowired
	ServletContext application;
	
	@GetMapping(value = "/add/{bno}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@PreAuthorize("permitAll()")
	public Integer addLike(
			HttpServletRequest req
			, @PathVariable("bno") String bno) {
		
		Map<String,Integer> likeMap = (Map)application.getAttribute("likeMap");
		likeMap.put(bno, likeMap.get(bno)+1);
		return likeMap.get(bno);
	}
	
	@GetMapping(value = "/get/{bno}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@PreAuthorize("permitAll()")
	public Integer getLike(
			HttpServletRequest req
			, @PathVariable("bno") String bno) {
		
		synchronized (this) {
			Object obj = application.getAttribute("likeMap");
			if (null == obj) {
				Map<String,Integer> likeMap = new HashMap<String,Integer>();
				application.setAttribute("likeMap", likeMap);
			}
		}
		
		Map<String,Integer> likeMap = (Map)application.getAttribute("likeMap");
		if (null == likeMap.get(bno)) {
			likeMap.put(bno, 0);
		}
		return likeMap.get(bno);
	}

}
