package kr.co.korea.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@PutMapping("/likeupdate")
	public Map<String,String> likeupdate(@RequestBody LikeBean likebean){
		logger.info("likeupdate");
		
		Map<String,String> map = new HashMap<String, String>();
		
		try {
			likeservice.likeupdate(likebean);
			map.put("result", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
	
	
	
}
