package kr.co.korea.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@PostMapping("/idcheck/{mid}")
	public Map<String,String> idcheck(@PathVariable String mid){
		
		logger.info("idcheck");
		Map<String,String> map = new HashMap<String, String>();
		
		int checkid =0;
		
		try {
			
			checkid = memberservice.idCheck(mid); 
			
			if(checkid==1) {
				map.put("result", "fail");
			}else {
				map.put("result", "success");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "success");
		}
		
		return map;
	}
	
	
}
