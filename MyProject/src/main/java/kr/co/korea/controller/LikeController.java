package kr.co.korea.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.LikeBean;
import kr.co.korea.service.LikeService;

@RestController
@RequestMapping("/like")
public class LikeController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
	
	@Autowired
	private LikeService likeservice;
	
	@PostMapping("/check")
	public Map<String,String> likeCheck(@RequestBody LikeBean likebean){
		logger.info("likecheck");
		
		Map<String,String> map = new HashMap<String, String>();
		
		String check = likeservice.likeCheck(likebean);
		
		try {
			if(check == "ok") {
				map.put("result", "ok");
			}else {
				map.put("result", "no");
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "no");
		}
		
		return map;
	}
	
	@PostMapping("/ltlikecheck")
	public Map<String,String> ltlikeCheck(@RequestBody LikeBean likebean){
		logger.info("ltlikeCheck");
		
		Map<String,String> map = new HashMap<String, String>();
		
		int check = likeservice.ltlikeCheck(likebean);
		
		try {
			if(check == 0) {
				map.put("result", "no");
			}else {
				map.put("result", "like");
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "no");
		}
		
		return map;
	}
	
	
}
