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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.beans.Criteria;
import kr.co.korea.beans.LikeBean;
import kr.co.korea.beans.PageMaker;
import kr.co.korea.service.BoardService;
import kr.co.korea.service.LikeService;

@Controller
@RequestMapping("/boards")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private LikeService likeservice;

	@GetMapping("") 
	public String list(Model model,@ModelAttribute("cri") Criteria cri) {
		logger.info("boardlist");
		
		List<BoardBean> list = boardservice.getboardlist(cri);
		
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(boardservice.countBoard());
		
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("list",list);
		return "/board/list";
	}
	
	@GetMapping("/{bid}")
	public String read(@PathVariable int bid,Model model,@ModelAttribute("cri") Criteria cri) {
		logger.info("boardread");
		
		BoardBean boardbean = boardservice.readboard(bid);
		
		LikeBean likebean = new LikeBean();
		likebean.setLtbid(bid);
		likebean.setLtmid(currentUserName());
		
		int ltlike = 0;
		
		int check = likeservice.ltlikecount(likebean);
		
		if(check ==0) {
			
			likeservice.likeinsert(likebean);
			
		}else if(check==1) {
			
			ltlike = likeservice.ltlikegetinfo(likebean);
		}
		
		model.addAttribute("board",boardbean);
		model.addAttribute("ltlike",ltlike);
		return "/board/read";
	}
	
	@GetMapping("/newBoard")
	public String write(@ModelAttribute("cri") Criteria cri) {
		logger.info("newPost");
		return "/board/write";
	}

	@GetMapping("/newBoard/{bid}")
	public String update(@PathVariable int bid,Model model,String type,@ModelAttribute("cri") Criteria cri) {
		logger.info("Put,Delete view");
		BoardBean boardbean = boardservice.readboard(bid);
		model.addAttribute("board",boardbean);
		
		if(type.equals("edit")) return "board/update";
		else return "board/delete";
		
	}
	
	@GetMapping("/notwriter")
	public String notwriter() {
		return "board/NotWriter";
	}
	
	//유저의 아이디를 가져옴
	private static String currentUserName() { 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		String user = auth.getName(); 
		return user; 
	}

}
