package kr.co.korea.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardservice;

	@GetMapping("list")
	public String list(Model model) {
		logger.info("boardlist");
		
		List<BoardBean> list = boardservice.getboardlist();
		
		model.addAttribute("list",list);
		return "/board/list";
	}

	@GetMapping("write")
	public String write() {
		logger.info("write");
		return "/board/write";
	}

	@PostMapping("writeok")
	public String writeok(BoardBean boardbean,RedirectAttributes rddr) {
		logger.info("writeok");
		
		String username=currentUserName();
		
		boardservice.writeboard(boardbean,username);
		
		rddr.addAttribute("bid", boardbean.getBid());
		
		return "redirect:/board/read";
	}
	
	@GetMapping("read")
	public String read(int bid,Model model) {
		
		logger.info("boardread");
		
		BoardBean boardbean = boardservice.readboard(bid);
		model.addAttribute("board",boardbean);
		return "/board/read";
	}
	
	//유저의 아이디를 가져옴
	private static String currentUserName() { 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		String user = auth.getName(); 
		return user; 
	}


}
