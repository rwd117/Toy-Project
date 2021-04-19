package kr.co.korea.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.service.BoardService;

@RestController
@RequestMapping("/boards")
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardservice;
	
	
	@PostMapping("")
	public int writeok(@RequestBody BoardBean boardbean) {
		logger.info("writePost");
		
		String username=currentUserName();
		boardservice.writeboard(boardbean,username);
		return boardbean.getBid();
	}
	
	@PutMapping("/{bid}")
	public int updateok(@PathVariable int bid,@RequestBody BoardBean boardbean) {
		logger.info("updatePost");
		
		boardservice.updateBoard(boardbean);
		
		return bid;
	}
	
	@DeleteMapping("/{bid}")
	public void deleteok(@PathVariable int bid) {
		logger.info("deletePost");
		
		boardservice.deleteBoard(bid);
	}
	
	//유저의 아이디를 가져옴
	private static String currentUserName() { 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		String user = auth.getName(); 
		return user; 
	}
	
}
