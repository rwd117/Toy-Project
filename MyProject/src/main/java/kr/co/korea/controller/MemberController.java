package kr.co.korea.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.korea.beans.MemberBean;
import kr.co.korea.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@GetMapping("join")
	public String join() {
		logger.info("join");
		return "/member/join";
	}
	
	@RequestMapping(value="login")
	public String login() {
		
		return "/member/login";
	}
	
	@PostMapping("joinok")
	public String joinOk(MemberBean memberbean) {
		logger.info("joinok");
		memberservice.inserMember(memberbean);
		return "redirect:/";
	}
	
}
