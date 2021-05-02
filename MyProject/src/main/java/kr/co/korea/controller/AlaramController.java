package kr.co.korea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.AlarmBean;
import kr.co.korea.service.AlarmService;

@RestController
@RequestMapping("/savealarm")
public class AlaramController {

	@Autowired
	private AlarmService alarmservice;
	
	@PostMapping("/no")
	public List<AlarmBean> alarmlist(){
		List<AlarmBean> list = new ArrayList<>();
		
		list = alarmservice.alarmlist();
		
		return list;
	}
	
	@PostMapping("")
	public Map<String,Object> alarminsert(@RequestBody AlarmBean alarmbean) {
			
		Map<String,Object> map = new HashMap<String, Object>();
		
		try {
			alarmbean.setAmid(currentUserName());
			
			alarmservice.alarminsert(alarmbean);
			map.put("result", "success");
			
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
