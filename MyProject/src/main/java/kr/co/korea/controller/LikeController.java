package kr.co.korea.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.korea.beans.LikeBean;
import kr.co.korea.service.LikeService;

@RestController
@RequestMapping("/like")
public class LikeController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
	
	@Autowired
	private LikeService likeservice;
	
	@PutMapping("/likeupdate")
	public Map<String,Object> likeupdate(@RequestBody LikeBean likebean){
		logger.info("likeupdate");
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		try {
			likebean.setLtmid(currentUserName());
			likeservice.likeupdate(likebean);
			int like = likebean.getAllltlike();
			
			map.put("result", "success");
			map.put("like", like);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
	
	//유저의 아이디를 가져옴
	private String currentUserName() { 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		String user = auth.getName(); 
		return user; 
	}
	
	
	
}
